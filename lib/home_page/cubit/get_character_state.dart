part of 'get_character_cubit.dart';

@immutable
abstract class GetCharacterState {}

class GetCharacterInitial extends GetCharacterState {}

class GetCharacterError extends GetCharacterState {}

class GetCharacterSuccess extends GetCharacterState {
  final CharacterModel model;
  GetCharacterSuccess({required this.model});
}
