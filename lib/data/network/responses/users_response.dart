import 'package:web/data/models/account_model.dart';

class UsersDataResponse {
  UsersDataResponse({
    this.status,
    this.message,
    this.user,
  });

  int? status;
  String? message;
  List<AccountModel>? user;

  factory UsersDataResponse.fromJson(Map<String, dynamic> json) => UsersDataResponse(
    status: json["status"],
    message: json["message"],
    user: json["users"] != null
        ? List<AccountModel>.from(
        json["users"].map((x) => AccountModel.fromJson(x)))
        : json["users"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "users": List<dynamic>.from(user!.map((x) => x.toJson())),
  };
}
