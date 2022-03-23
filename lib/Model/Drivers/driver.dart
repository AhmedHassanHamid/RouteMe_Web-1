class DriversModel {
  final String id;
  final String status;
  final String email;
  final String name;
  final String phone;
  final String server;
  final String password;
  final Map<String, dynamic> actions;

  DriversModel(this.id, this.status, this.email, this.name, this.phone,
      this.actions, this.password, this.server);

  factory DriversModel.fromJson(json) {
    print(json['email']);
    return DriversModel(
        json['id'].toString(),
        json['status'] ?? '',
        json['email'] ?? '',
        json['name'] ?? '',
        json['phone'] ?? '',
        {"edit": true, "delete": true, "id": json['id'].toString()},
        json['password'] ?? '',
        json['server'] ?? '');
  }
}
