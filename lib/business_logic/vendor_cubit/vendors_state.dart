part of 'vendors_cubit.dart';

@immutable
abstract class VendorsState {}

class VendorsInitial extends VendorsState {}

class VendorsLoadingState extends VendorsState {}

class VendorsSuccessState extends VendorsState {
  final VendorsResponse vendorResponse;

  VendorsSuccessState(this.vendorResponse);
}

class VendorsErrorState extends VendorsState {
  final String error;

  VendorsErrorState(this.error);
}