import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repository/src/models/character.dart';
import 'package:repository/repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.repo) : super(const CharactersState());

  final Repository repo;

  Future<void> getCharacters() async {
    emit(state.copyWith(status: CharactersStatus.loading));
    try {
      final characters = await repo.getCharacter();
      emit(state.copyWith(status: CharactersStatus.success, characters: characters));
    } catch (e) {
      emit(state.copyWith(status: CharactersStatus.failure));
    }
  }
}
