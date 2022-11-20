part of 'characters_cubit.dart';

enum CharactersStatus { initial, loading, success, failure }

@immutable
class CharactersState {
  const CharactersState(
      {this.characters = const <Character>[],
      this.status = CharactersStatus.initial});

  final CharactersStatus status;
  final List<Character> characters;

  CharactersState copyWith(
      {CharactersStatus? status, List<Character>? characters}) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
    );
  }
}
