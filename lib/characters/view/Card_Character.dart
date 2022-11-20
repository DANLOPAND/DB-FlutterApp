import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:repository/src/models/character.dart';

Widget cardCharacter(Character character) {
  print(
      "${character.id} ${character.name} ${character.imageUrl} ${character.originPlanet} ${character.role} ${character.specie} ${character.status} ${character.transform} ${character.universe}");
  return GestureDetector(
    child: Card(
        elevation: 5,
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Image.network(character.imageUrl, repeat: ImageRepeat.repeat, fit: BoxFit.cover,),
            ),
            Center(child: Image.network(character.imageUrl)),
          ],
        )),
  );
}
