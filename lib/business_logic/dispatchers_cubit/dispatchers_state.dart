part of 'dispatchers_cubit.dart';

@immutable
abstract class DispatchersState {}

class DispatchersInitial extends DispatchersState {}

class DispatchersLoadingState extends DispatchersState {}

class DispatchersSuccessState extends DispatchersState {
  final UsersDataResponse dispatchersResponse;

  DispatchersSuccessState(this.dispatchersResponse);
}

class DispatchersErrorState extends DispatchersState {
  final String error;

  DispatchersErrorState(this.error);
}