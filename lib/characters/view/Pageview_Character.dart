import 'package:flutter/material.dart';
import 'package:repository/src/models/character.dart';
import '../../character_main/cubit/character_main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'card_character.dart';

class Pageview_Character extends StatelessWidget {
  final BuildContext context;
  final List<Character> characters;

  const Pageview_Character(
      {Key? key, required this.characters, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterReversed = characters.reversed.toList();
    return SizedBox(
      child: PageView(
        children: <Widget>[
          PageView.builder(
            padEnds: false,
            controller: PageController(viewportFraction: 1/3, initialPage: 0),
            itemCount: characterReversed.length,
            itemBuilder: (BuildContext context, int index) {
              return cardCharacter(characterReversed[index]);
            },
            onPageChanged: (value) {
              context.read<CharacterMainCubit>().setCharacter(characterReversed[value]);
            },
          ),
        ],
      ),
    );
  }
}
