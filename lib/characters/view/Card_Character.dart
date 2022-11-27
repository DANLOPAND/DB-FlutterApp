import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:repository/src/models/character.dart';

Widget cardCharacter(Character character) {
  return GestureDetector(
    child: Card(
        elevation: 5,
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.network(character.imageUrl, repeat: ImageRepeat.repeat, fit: BoxFit.cover),
            ),
            Center(child: Image.network(character.imageUrl)),
          ],
        )),
  );
}
