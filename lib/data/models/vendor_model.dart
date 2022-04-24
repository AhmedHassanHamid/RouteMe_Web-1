class VendorModel {
  int id;
  String name;
  String server;
  String email;
  String password;
  String brandImage;
  String phone;
  String type;

  VendorModel({
    required this.id,
    required this.name,
    required this.server,
    required this.email,
    required this.password,
    required this.brandImage,
    required this.phone,
    required this.type,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
    id: json["id"],
    name: json["name"],
    server: json["server"],
    email: json["email"],
    password: json["password"],
    brandImage: json['brandImage'],
    phone: json["phone"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "server": server,
    "email": email,
    "password": password,
    "brandImage":brandImage,
    "phone": phone,
    "type": type,
  };
}
