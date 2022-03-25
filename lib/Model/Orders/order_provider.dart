import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:web/Pages/orders.dart';
import 'order.dart';
import 'package:http/http.dart' as http;

import 'order_data_source.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orders = <OrderModel>[];
  OrderDataSource? orderDataSource;
  bool showGrid = false;
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;
  getOrdersData({bool refresh = false}) async {
    if (orders.isNotEmpty && !refresh) {
      return;
    }
    showGrid = false;
    orderDataSource = null;
    orders.clear();
    notifyListeners();
    final response = await http.post(
      Uri.parse(
        "https://route-me2022.herokuapp.com/api/searchOrders?orderId=${_controller.text}",
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      final List data = json.decode(response.body);
      data.forEach((element) {
        orders.add(OrderModel.fromJson(element));
      });
      if (orders.length > 1) {
        orders.removeLast();
      }
      orderDataSource = OrderDataSource(orders: orders);
      showGrid = true;
    }
    print("length: ${orders.length}");
    print("total : ${orderDataSource!.rows.length}");

    notifyListeners();
    print(response.body);
  }
}
