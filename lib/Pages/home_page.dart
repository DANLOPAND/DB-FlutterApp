import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../characters/characters.dart';
import '../characters/cubit/characters_cubit.dart';
import '../character_main/cubit/character_main_cubit.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/models/character.dart';



class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersCubit(context.read<Repository>())..getCharacters(),
        ),
        BlocProvider(
          create: (context) => CharacterMainCubit(Character.empty()),
        ),
      ],
      child: const CharactersPage(),
    );
  }
}
