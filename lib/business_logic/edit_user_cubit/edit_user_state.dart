part of 'edit_user_cubit.dart';

@immutable
abstract class EditUserState {}

class EditUserInitial extends EditUserState {}

class EditUserLoadingState extends EditUserState {}

class EditUserSuccessState extends EditUserState {
  final SuccessfulResponse successfulResponse;

  EditUserSuccessState(this.successfulResponse);
}

class EditUserErrorState extends EditUserState {
  final String error;

  EditUserErrorState(this.error);
}

