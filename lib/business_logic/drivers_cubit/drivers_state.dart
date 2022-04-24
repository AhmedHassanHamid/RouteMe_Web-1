part of 'drivers_cubit.dart';

@immutable
abstract class DriversState {}

class DriversInitial extends DriversState {}

class DriversLoadingState extends DriversState {}

class DriversSuccessState extends DriversState {
  final UsersDataResponse driverResponse;

  DriversSuccessState(this.driverResponse);
}

class DriversErrorState extends DriversState {
  final String error;

  DriversErrorState(this.error);
}

