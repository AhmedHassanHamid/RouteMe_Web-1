class VendorsModel {
  final String id;
  final String status;
  final String email;
  final String name;
  final String phone;
  final Map<String, dynamic> actions;

  VendorsModel(
      this.id, this.status, this.email, this.name, this.phone, this.actions);

  factory VendorsModel.fromJson(json) {
    return VendorsModel(
      json['id'].toString(),
      "in progress",
      json['email'] ?? '',
      json['brandName'] ?? '',
      json['phone'] ?? '',
      {"edit": true, "delete": true, "id": json["id"].toString()},
    );
  }
}
