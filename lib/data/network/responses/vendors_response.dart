import 'package:web/data/models/vendor_model.dart';

class VendorsResponse {
  VendorsResponse({
    this.status,
    this.message,
    this.user,
  });

  int? status;
  String? message;
  List<VendorModel>? user;

  factory VendorsResponse.fromJson(Map<String, dynamic> json) => VendorsResponse(
    status: json["status"],
    message: json["message"],
    user: json["users"] != null
        ? List<VendorModel>.from(
        json["users"].map((x) => VendorModel.fromJson(x)))
        : json["users"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "users": List<dynamic>.from(user!.map((x) => x.toJson())),
  };
}
