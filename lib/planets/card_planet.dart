import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repository/src/models/planet.dart';
import 'package:repository/repository.dart';


Widget cardPlanet(Planet planet) {
  final repo = Repository();
  final planets = repo.getCharacter();
  return GestureDetector(
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Ink.image(
            image: AssetImage(planet.imageUrl),
            fit: BoxFit.cover,
          ),
          Text(
            planet.name,
            style: GoogleFonts.anton(
                textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ],
      ),
    ),
    onTap: () {
      //final List<Character> nuevaLista = State..where((element) => element.originPlanet.name == planet.name).toList();
      //print(nuevaLista);
    },
  );
}
