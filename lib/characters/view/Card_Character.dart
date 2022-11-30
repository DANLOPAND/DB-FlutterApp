import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:repository/src/models/character.dart';

Widget cardCharacter(Character character) {
  return GestureDetector(
    child: Card(
        elevation: 5,
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media.discordapp.net/attachments/404777964706725892/1046957028364525608/nebula-watercolor-galaxy-olga-shvartsur.jpg?width=479&height=671'),
                      fit: BoxFit.cover)),
            ),
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.network(character.imageUrl,
                  repeat: ImageRepeat.repeat, fit: BoxFit.cover),
            ),
            Center(
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
          ],
        )),
  );
}
