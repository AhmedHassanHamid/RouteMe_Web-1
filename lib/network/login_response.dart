import 'package:web/network/account_model.dart';

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.user,
  });

  int? status;
  String? message;
  List<AccountModel>? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    status: json["status"],
    message: json["message"],
    user: json["user"] != null ? List<AccountModel>.from(json["user"].map((x) => AccountModel.fromJson(x))) : json["user"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": List<dynamic>.from(user!.map((x) => x.toJson())),
  };
}