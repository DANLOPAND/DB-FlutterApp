import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../character_main/cubit/character_main_cubit.dart';
import 'cubit/characters_cubit.dart';
import 'view/Pageview_Character.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  //function to get the asset of the planet


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
                                image: AssetImage('assets/img/wp.jgp',),
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    '/img/CN-01.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: double.infinity,
                            //color: Color.fromARGB(115, 43, 43, 43),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: 
                                  Container(
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
                                  child: Image.network(state.character.imageUrl,width: 300, height: 350,),
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Container(
                                    width: 400,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(26, 112, 112, 112),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    
                                    child: Column(
                                      children:  [
                                        Row(
                                          children: [
                                            Text("${state.character.name}".toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 27),),

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Text("${state.character.role}".toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 15),),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Text("${state.character.originPlanet}".toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 15),),
                                          ],
                                        ),
                                      
                                      ],
                                    ),
                                  ),
                               ),
                              //   Positioned(child: Stack(
                              //      children: [
                              //        Positioned(
                              //          top: 10,
                              //          right: 10,
                              //          child: Container(
                              //           width: 30,
                              //           height: 30,
                              //           decoration: BoxDecoration(
                              //             color: Colors.white,
                              //             borderRadius: BorderRadius.circular(10),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
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
