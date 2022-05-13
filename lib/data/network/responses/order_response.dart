import 'package:web/data/models/order_model.dart';

class OrderResponse {
  OrderResponse({
    this.status,
    this.message,
    this.orders,
  });

  int? status;
  String? message;
  List<OrderModel>? orders;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    status: json["status"],
    message: json["message"],
    orders: json["orders"] != null
        ? List<OrderModel>.from(
        json["orders"].map((x) => OrderModel.fromJson(x)))
        : json["orders"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}
