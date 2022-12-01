part of 'character_main_cubit.dart';

//en el cubit se maneja el estado de la app, esta se divide en 3 partes
//1. estado inicial
//2. estado de carga
//3. estado de carga exitosa
//4. estado de carga fallida
// En esta clase Le asignamos a CharacterMainState 
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
