part of 'characters_cubit.dart';

enum CharactersStatus { initial, loading, success, failure }

//en la clase CharactersState se maneja el estado de la app.
@immutable
class CharactersState {
  const CharactersState(
      {this.characters = const <Character>[],
      this.status = CharactersStatus.initial});
      
  //en este caso se crean 2 variables, una para el estado de la app y otra para la lista de personajes
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
