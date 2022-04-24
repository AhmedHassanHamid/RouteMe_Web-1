part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrderInitial extends OrdersState {}

class OrderLoadingState extends OrdersState {}

class OrderSuccessState extends OrdersState {
  final OrderResponse orderResponse;

  OrderSuccessState(this.orderResponse);
}

class OrderErrorState extends OrdersState {
  final String error;

  OrderErrorState(this.error);
}
