part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageLoadingState extends LanguageState {}

class LanguageChangeState extends LanguageState {}

class LanguageSuccessState extends LanguageState {
  final String local;
  LanguageSuccessState(this.local);
}

class LanguageErrorState extends LanguageState {
  final String error;

  LanguageErrorState(this.error);
}