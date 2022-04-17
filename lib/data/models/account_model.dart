class AccountModel {
  int id;
  String name;
  String server;
  String email;
  String password;
  String phone;
  String type;

  AccountModel({
    required this.id,
    required this.name,
    required this.server,
    required this.email,
    required this.password,
    required this.phone,
    required this.type,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"],
        name: json["name"],
        server: json["server"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "server": server,
        "email": email,
        "password": password,
        "phone": phone,
        "type": type,
      };
}
