import 'package:flutter/material.dart';
import 'package:repository/src/models/character.dart';
import '../../character_main/cubit/character_main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Card_Character.dart';

class CharacterPage extends StatelessWidget {
  final BuildContext context;
  final List<Character> characters;

  const CharacterPage(
      {Key? key, required this.characters, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView(
        children: <Widget>[
          PageView.builder(
            padEnds: false,
            controller: PageController(viewportFraction: 1 / 2, initialPage: 0),
            itemCount: characters.length,
            itemBuilder: (BuildContext context, int index) {
              return cardCharacter(characters[index]);
            },
            onPageChanged: (value) {
              context.read<CharacterMainCubit>().setCharacter(characters[value]);
            },
          ),
        ],
      ),
    );
  }
}
