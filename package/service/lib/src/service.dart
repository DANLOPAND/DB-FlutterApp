// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:repository/src/models/character.dart';

class Service {
  /// {@macro service}
  final String _baseUrl = 'dragon-ball-super-api.herokuapp.com';
  final String _endPoint = '/api/characters';

  Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('https://$_baseUrl$_endPoint'));
    if (response.statusCode == 200) {
      final utf = utf8.decode(response.bodyBytes);
      final body = jsonDecode(utf) as List;
      final characters = body.map<Character>((dynamic json) {
        return Character.fromJson(json as Map<String, dynamic>);
      }).toList();
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
