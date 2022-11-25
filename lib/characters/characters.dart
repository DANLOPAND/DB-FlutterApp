import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../character_main/cubit/character_main_cubit.dart';
import 'cubit/characters_cubit.dart';
import 'view/Pageview_Character.dart';
import '../characters/planets.dart';
import 'package:google_fonts/google_fonts.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  //function to get the asset of the planet
  String getAsset(String planet) {
    switch (planet) {
      case 'Planeta Tsufrui':
        return '/img/Tsufrui.jpg';

      case 'Planeta Sadala':
        return '/img/Sadala.jpg';

      case 'Planeta Tierra':
        return '/img/Tierra.jpg';

      case 'Planeta del Núcleo del Mundo':
        return '/img/Nucleo.jpg';

      case 'Planeta Vegeta':
        return '/img/Pvegeta.jpg';

      case 'Planeta Yardat':
        return '/img/Yardat.jpg';
    }
    return '/img/CN-01.png';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        switch (state.status) {
          case CharactersStatus.initial:
            return const Center(
              child: Text('yooooooooo'),
            );
          case CharactersStatus.loading:
            return const Center(
              child: Text('Loading'),
            );
          case CharactersStatus.success:
            return Column(children: [
              Expanded(
                  flex: 3,
                  child: BlocBuilder<CharacterMainCubit, CharacterMainState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case CharacterMainStatus.initial:
                          return Container(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      getAsset(state.character.originPlanet)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black,
                                        ],
                                      ),
                                    ),
                                  ),
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
                                ],
                              ),
                            ),
                          );
                        case CharacterMainStatus.loading:
                          return const Center(
                            child: Text('Loading'),
                          );
                        case CharacterMainStatus.success:
                          return Container(
                            //asset de background
                            color: Colors.black,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      getAsset(state.character.originPlanet)),
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
                                      state.character.imageUrl,
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
                                        color: const Color.fromARGB(
                                            171, 12, 12, 12),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, top: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  state.character.name
                                                      .toUpperCase(),
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
                                            margin:
                                                const EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                  state.character.role
                                                      .toUpperCase(),
                                                  style: GoogleFonts.anton(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                  state.character.originPlanet
                                                      .toUpperCase(),
                                                  style: GoogleFonts.anton(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 37, 93, 248),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Center(
                                        child: IconButton(
                                          color: Colors.white,
                                          icon: const Icon(Icons.public),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SecondRoute()));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        case CharacterMainStatus.failure:
                          return const Center(
                            child: Text('Failure'),
                          );
                      }
                    },
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: const Color.fromARGB(255, 34, 34, 34),
                    child: CharacterPage(
                        characters: state.characters, context: context),
                  ))
            ]);
          case CharactersStatus.failure:
            return const Center(
              child: Text('failed to fetch characters'),
            );
        }
      },
    );
  }
}
