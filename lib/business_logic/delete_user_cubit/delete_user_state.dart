part of 'delete_user_cubit.dart';

@immutable
abstract class DeleteUserState {}

class DeleteUserInitial extends DeleteUserState {}

class DeleteUserLoadingState extends DeleteUserState {}

class DeleteUserSuccessState extends DeleteUserState {
  final SuccessfulResponse successfulResponse;

  DeleteUserSuccessState(this.successfulResponse);
}

class DeleteUserErrorState extends DeleteUserState {
  final String error;

  DeleteUserErrorState(this.error);
}