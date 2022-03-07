class DispatcherModel {
  DispatcherModel(this.status, this.email, this.name, this.phone, this.actions);

  final String status;
  final String name;
  final String email;
  final String phone;
  final Map<String, dynamic> actions;
}
