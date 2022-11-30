import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../character_main/cubit/character_main_cubit.dart';
import '../characters/cubit/characters_cubit.dart';
import '../characters/view/Pageview_Character.dart';
import '../characters/view/presentation_character.dart';

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
              child: Text('Iniciando'),
            );
          case CharactersStatus.loading:
            return const Center(
              child: Text('Loading'),
            );
          case CharactersStatus.success:
            final firstCharacter = state.characters.last;
            return Column(children: [
              Expanded(
                  flex: 3,
                  child: BlocBuilder<CharacterMainCubit, CharacterMainState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case CharacterMainStatus.initial:
                          return presentationCharacter(context, firstCharacter);
                        case CharacterMainStatus.loading:
                          return const Center(
                            child: Text('Loading'),
                          );
                        case CharacterMainStatus.success:
                          return presentationCharacter(context, state.character);
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
                    child: Pageview_Character(
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
