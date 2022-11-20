import 'package:bloc/bloc.dart';
import 'package:repository/src/models/character.dart';
part 'character_main_state.dart';

class CharacterMainCubit extends Cubit<CharacterMainState> {
  CharacterMainCubit(this.character) : super(CharacterMainState(CharacterMainStatus.initial, character));

  final Character character;
  

  void setCharacter(character) async {
        emit(state.copyWith(status: CharacterMainStatus.loading));
    try {
      emit(state.copyWith(status: CharacterMainStatus.success, character: character));
    } catch (e) {
      emit(state.copyWith(status: CharacterMainStatus.failure));
    }
  }
}
