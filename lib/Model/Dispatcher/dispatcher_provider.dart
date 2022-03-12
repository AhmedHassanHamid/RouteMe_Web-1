import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:web/Model/Dispatcher/dispatcher.dart';

import 'dispatcher_data_source.dart';
import 'package:http/http.dart' as http;

class Dispatcherprovider with ChangeNotifier {
  List<DispatcherModel> dispatchers = <DispatcherModel>[];
  late DispatcherDataSource? dispatcherDataSource;
  bool showGrid = false, editMode = false;

  DispatcherModel? selectedDispatcher;

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

  getDispatcherData({bool refresh = false}) async {
    if (dispatchers.isNotEmpty && !refresh) {
      return;
    }
    if (refresh) {
      dispatchers.clear();
    }
    final response = await http.post(
      Uri.parse(
        "https://route-me2022.herokuapp.com/api/getUsers?type=dispatcher",
      ),
    );
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      data.forEach((element) {
        dispatchers.add(DispatcherModel.fromJson(element));
      });
      dispatcherDataSource = DispatcherDataSource(
          dispatchers: dispatchers, dispatcherProvider: this);
      showGrid = true;
    }
    print("total : ${dispatcherDataSource!.rows.length}");
    notifyListeners();
    print(response.body);
  }

  deleteUser(String? id) async {
    final response = await http.post(
      Uri.parse(
          "https://route-me2022.herokuapp.com/api/deleteUser?type=dispatcher&id=$id"),
    );
    if (response.statusCode == 200) {
      dispatchers.removeWhere((element) => element.id == id);
      dispatcherDataSource = DispatcherDataSource(
          dispatchers: dispatchers, dispatcherProvider: this);
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
          "https://route-me2022.herokuapp.com/api/addDispatcher?server=${_serverController.text}&name=${_nameController.text}&email=${_emailController.text}&password=${_passwordController.text}&phone=${_phoneController.text}"),
    );
    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      getDispatcherData(refresh: true);
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
    selectedDispatcher = dispatchers.firstWhere((element) => element.id == id);
    nameController.text = selectedDispatcher!.name;
    emailController.text = selectedDispatcher!.email;
    phoneController.text = selectedDispatcher!.phone;
    passwordController.text = selectedDispatcher!.password;
    serverController.text = selectedDispatcher!.server;

    editMode = true;
    notifyListeners();
  }

  disableEditMode() {
    selectedDispatcher = null;
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
          "https://route-me2022.herokuapp.com/api/updateUser?server=${_serverController.text}&name=${_nameController.text}&email=${_emailController.text}&password=${_passwordController.text}&phone=${_phoneController.text}&id=${selectedDispatcher!.id}&type=dispatcher"),
    );
    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      getDispatcherData(refresh: true);
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
