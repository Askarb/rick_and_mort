import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/home_page/models/character_model.dart';
import 'package:rick_and_morty/home_page/repositories/get_character_repo.dart';

part 'get_character_state.dart';

class GetCharacterCubit extends Cubit<GetCharacterState> {
  GetCharacterCubit({required this.repo}) : super(GetCharacterInitial());

  final GetCharacterRepo repo;

  Future getCharecter(String? name) async {
    try {
      final model = await repo.getCharacterData(name: name ?? '');
      emit(GetCharacterSuccess(model: model));
    } catch (e) {
      emit(GetCharacterError());
    }
  }
}
