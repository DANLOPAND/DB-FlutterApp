import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../character_main/cubit/character_main_cubit.dart';
import 'cubit/characters_cubit.dart';
import 'view/Pageview_Character.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

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
                          return const Center(
                            child: Text('Initial'),
                          );
                        case CharacterMainStatus.loading:
                          return const Center(
                            child: Text('Loading'),
                          );
                        case CharacterMainStatus.success:
                          return Container(
                            //asset de background
                            width: double.infinity,
                            color: Colors.black,
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.network(state.character.imageUrl,),
                                ),
                                Positioned(
                                  bottom: 70,
                                  left: 35,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(26, 112, 112, 112),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            //Text(' Nombre: ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                            Text(state.character.name, style: TextStyle(color: Colors.white, fontSize: 30),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            //Text(' Especie: ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                            Text(state.character.role, style: TextStyle(color: Colors.white, fontSize: 20),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            //Text(' role: ', style: TextStyle(color: Colors.white, fontSize: 20),),
                                            Text(state.character.status, style: TextStyle(color: Colors.white, fontSize: 20),),
                                          ],
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
                  child: CharacterPage(
                      characters: state.characters, context: context))
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
