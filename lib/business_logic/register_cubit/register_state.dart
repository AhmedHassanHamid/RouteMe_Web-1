part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final SuccessfulResponse successfulResponse;

  RegisterSuccessState(this.successfulResponse);
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}