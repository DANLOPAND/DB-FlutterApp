// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repository/src/models/character.dart';

class Service {
  /// {@macro service}
  //en esta class service se maneja la obtencion de los datos de la api utilizando el endpoint que esta nos trae
  final String _baseUrl = 'rickandmortyapi.com';
  final String _endPoint = '/api/character';

  Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('https://$_baseUrl$_endPoint'));
    if (response.statusCode == 200) {
      final utf = utf8.decode(response.bodyBytes);
      final body = jsonDecode(utf)['results'] as List;
      final characters = body.map<Character>((dynamic json) {
        print(json['origin']['name'].toString());
        return Character.fromJson(json as Map<String, dynamic>);
      }).toList();
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }


  Future<String> getImage(String url,String name) async {
    Future<Uint8List> saveImage(String url) async {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        return bytes;
      } else {
        throw Exception('Failed to load image');
      }
    }
    //creamosuna variable para guardar imagenes como la de la tarjeta y el fondo de esta
    final card = decodeImage(
      await saveImage(
        'https://cdn.discordapp.com/attachments/745446154925375488/1046906493628317796/Card.png',
      ),
    );
    final background = decodeImage(
      await saveImage(
        'https://i.pinimg.com/originals/b2/83/d4/b283d46d979918180173f94898be201f.png',
      ),
    );
    final characterImg =
        copyResize(decodeImage(await saveImage(url))!, height: 1000);

    final mergedImage = img.Image(card!.width, card.height);

    copyInto(mergedImage, background!);
    //damos las dimenciones de la imagen de la tarjeta, del personaje y del fondo
    copyInto(
      mergedImage,
      characterImg,
      dstY: (card.height ~/ 2) - (characterImg.height ~/ 2),
      dstX: (card.width ~/ 2) - (characterImg.width ~/ 2),
    );

    copyInto(mergedImage, card);
    final text = img.drawString(
      mergedImage,
      img.arial_48,
      50,
      1087,
      name,
    );

    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.png';
    File(path).writeAsBytesSync(encodePng(mergedImage));
    return path;
  }
}
