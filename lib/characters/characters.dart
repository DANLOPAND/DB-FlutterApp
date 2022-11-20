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
                          return Center(
                              child: Text(
                                  '${state.character.name} ${state.character.status}',
                                  style: const TextStyle(fontSize: 20)));
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
