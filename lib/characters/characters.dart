import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../character_main/cubit/character_main_cubit.dart';
import 'cubit/characters_cubit.dart';
import 'view/Pageview_Character.dart';

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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  '/img/Walper.jpg',
                                ),
                                fit: BoxFit.cover,
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
                            decoration:  BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(getAsset(state.character.originPlanet)),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: double.infinity,
                            //color: Color.fromARGB(115, 43, 43, 43),
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
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(171, 12, 12, 12),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(left: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                state.character.name.toUpperCase(),
                                                style: const TextStyle(color: Colors.white,fontSize: 27),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 15),
                                          child: Row(
                                            children: [
                                              Text(
                                                state.character.role.toUpperCase(),
                                                style: const TextStyle(color: Colors.white,fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 15),
                                          child: Row(
                                            children: [
                                              Text(state.character.originPlanet.toUpperCase(),
                                                style: const TextStyle(color: Colors.white,fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
                    color: Color.fromARGB(255, 34, 34, 34),
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
