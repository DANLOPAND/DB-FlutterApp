import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repository/src/models/character.dart';
import 'package:repository/repository.dart';

part 'characters_state.dart';
//En la clase CharactersCubit se extiende de el estado del character
class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.repo) : super(const CharactersState());
  //reamos una variable para la clase repository que se encarga de obtener los datos de la api
  final Repository repo;

  Future<void> getCharacters() async {
    emit(state.copyWith(status: CharactersStatus.loading));
    try {
      //creamos una variable para obtener el metodo getCharacters de la clase repository
      final characters = await repo.getCharacter();
      //cuando se obtienen los datos de la api se cambia el estado de la app a success y se envia la lista de personajes
      emit(state.copyWith(status: CharactersStatus.success, characters: characters));
    } catch (e) {
      emit(state.copyWith(status: CharactersStatus.failure));
    }
  }
}
