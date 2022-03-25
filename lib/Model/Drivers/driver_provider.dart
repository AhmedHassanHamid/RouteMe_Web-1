import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web/Model/Drivers/driver_data_source.dart';
import 'package:web/Pages/drivers.dart';

import 'driver.dart';
import 'package:http/http.dart' as http;

class DriverProvider with ChangeNotifier {
  List<DriversModel> drivers = <DriversModel>[];
  late DriverDataSource? driverDataSource;
  bool showGrid = false, editMode = false;

  DriversModel? selectedDriver;
  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _serverController = TextEditingController();
  TextEditingController get serverController => _serverController;

  getDriversData({bool refresh = false}) async {
    if (drivers.isNotEmpty && !refresh) {
      return;
    }
    if (refresh) {
      drivers.clear();
    }
    final response = await http.post(
      Uri.parse(
        "https://route-me2022.herokuapp.com/api/getUsers?type=driver",
      ),
    );
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      data.forEach((element) {
        drivers.add(DriversModel.fromJson(element));
      });
      driverDataSource =
          DriverDataSource(drivers: drivers, driverProvider: this);
      showGrid = true;
    }
    print("total : ${driverDataSource!.rows.length}");
    notifyListeners();
    print(response.body);
  }

  deleteUser(String? id) async {
    final response = await http.post(
      Uri.parse(
          "https://route-me2022.herokuapp.com/api/deleteUser?type=driver&id=$id"),
    );
    if (response.statusCode == 200) {
      drivers.removeWhere((element) => element.id == id);
      driverDataSource =
          DriverDataSource(drivers: drivers, driverProvider: this);
      notifyListeners();
    }
  }

  addUser() async {
    if (_serverController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _serverController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please fill all data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    final response = await http.post(
      Uri.parse(
          "https://route-me2022.herokuapp.com/api/addDriver?server=${_serverController.text}&name=${_nameController.text}&email=${_emailController.text}&password=${_passwordController.text}&phone=${_phoneController.text}"),
    );
   final data = json.decode(response.body);

    if (response.statusCode == 200) {
      getDriversData(refresh: true);
    }
    Fluttertoast.showToast(
        msg: data['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  enableEditMode(String? id) {
    selectedDriver = drivers.firstWhere((element) => element.id == id);
    nameController.text = selectedDriver!.name;
    emailController.text = selectedDriver!.email;
    phoneController.text = selectedDriver!.phone;
    passwordController.text = selectedDriver!.password;
    serverController.text = selectedDriver!.server;

    editMode = true;
    notifyListeners();
  }

  disableEditMode() {
    selectedDriver = null;
    nameController.text = '';
    emailController.text = '';
    phoneController.text = '';
    passwordController.text = '';
    serverController.text = '';

    editMode = false;
    notifyListeners();
  }

  editUser() async {
    if (_serverController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _serverController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please fill all data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    final response = await http.post(
      Uri.parse(
          "https://route-me2022.herokuapp.com/api/updateUser?server=${_serverController.text}&name=${_nameController.text}&email=${_emailController.text}&password=${_passwordController.text}&phone=${_phoneController.text}&id=${selectedDriver!.id}&type=driver"),
    );
    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      getDriversData(refresh: true);
    }
    Fluttertoast.showToast(
        msg: data['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
