import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/data/models/order_model.dart';
import 'package:web/data/network/responses/order_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/widgets/toast.dart';
import 'package:web/constants/end_points.dart';

part 'orders_state.dart';

class OrderCubit extends Cubit<List<OrderModel>> {
  OrderCubit() : super([]);

  static OrderCubit get(context) => BlocProvider.of(context);

  OrderResponse? orderResponse, searchResponse;

  Future getOrders() async {
    await DioHelper.postData(
      url: searchOrders,
      body: {},
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      orderResponse = OrderResponse.fromJson(myData);
      if (orderResponse!.status == 200) {
        return orderResponse!.orders;
      } else {
        return orderResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return orderResponse!.orders;
  }

  Future searchForOrder({
    VoidCallback? afterSuccess,
    String? orderId,
  }) async {
    await DioHelper.postData(
      url: searchOrders,
      body: {
        'orderId': orderId,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      searchResponse = OrderResponse.fromJson(myData);
      if (searchResponse!.status == 200) {
        afterSuccess!();
        return searchResponse!.orders;
      } else {
        showToast(searchResponse!.message);
        return searchResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return searchResponse!.orders;
  }

  void get myOrders async => emit(await getOrders());
}
