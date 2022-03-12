class DispatcherModel {
  DispatcherModel(this.id, this.status, this.email, this.name, this.phone,
      this.actions, this.password, this.server);
  final String id;
  final String status;
  final String name;
  final String email;
  final String phone;
  final String server;
  final String password;
  final Map<String, dynamic> actions;

  factory DispatcherModel.fromJson(json) {
    return DispatcherModel(
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
