part of 'character_main_cubit.dart';

enum CharacterMainStatus { initial, loading, success, failure }

class CharacterMainState {
  CharacterMainState(this.status, this.character);

  final CharacterMainStatus status;
  final Character character;

  CharacterMainState copyWith(
      {CharacterMainStatus? status, Character? character}) {
    return CharacterMainState(status ?? this.status, character ?? this.character);
  }
}
