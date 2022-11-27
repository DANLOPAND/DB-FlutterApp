import 'package:flutter/material.dart';
import 'package:poke_api/characters/view/planet_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repository/src/models/character.dart';


Widget presentationCharacter(BuildContext context, Character character) {
  return Container(
    //asset de background
    color: Colors.black,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(character.originPlanet.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('/img/Db-Logo.png'),
                ),
              ),
            ),
          ),
          Center(
            child: Image.network(
              character.imageUrl,
              width: 300,
              height: 350,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              width: 700,
              height: 110,
              decoration: BoxDecoration(
                color: const Color.fromARGB(171, 12, 12, 12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Row(
                      children: [
                        Text(
                          character.name.toUpperCase(),
                          style: GoogleFonts.anton(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          character.role.toUpperCase(),
                          style: GoogleFonts.anton(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          character.originPlanet.name.toUpperCase(),
                          style: GoogleFonts.anton(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          planetButton(context)
        ],
      ),
    ),
  );
}
