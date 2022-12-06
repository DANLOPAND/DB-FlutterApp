import 'package:flutter/material.dart';
import 'package:repository/src/models/character.dart';

Widget cardCharacter(Character character) {
  return GestureDetector(
    child: Card(
        elevation: 5,
        child: Image.network(
          character.imageUrl,
          loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : const Center(
                child: CircularProgressIndicator(),
              );
          },
        )),
  );
}
