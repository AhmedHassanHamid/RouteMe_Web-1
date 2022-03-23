import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web/Model/vendors/vendor.dart';
import 'package:web/Model/vendors/vendor_data_source.dart';
import 'package:http/http.dart' as http;

class Vendorprovider with ChangeNotifier {
  List<VendorsModel> vendors = <VendorsModel>[];
  late VendorDataSource? vendorDataSource;
  bool showGrid = false, editMode = false;
  File? file;
  VendorsModel? selectedVendors;
  final ImagePicker _picker = ImagePicker();

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

  getVendorsData({bool refresh = false}) async {
    if (vendors.isNotEmpty && !refresh) {
      return;
    }
    if (refresh) {
      vendors.clear();
    }
    final response = await http.post(
      Uri.parse(
        "https://route-me2022.herokuapp.com/api/getUsers?type=vendor",
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      final List data = json.decode(response.body);
      data.forEach((element) {
        vendors.add(VendorsModel.fromJson(element));
      });
      vendorDataSource =
          VendorDataSource(vendors: vendors, vendorprovider: this);
      showGrid = true;
    }
    print("total : ${vendorDataSource!.rows.length}");
    notifyListeners();
    print(response.body);
  }

  deleteUser(String? id) async {
    print("id");
    final response = await http.post(
      Uri.parse(
          "https://route-me2022.herokuapp.com/api/deleteUser?type=vendor&id=$id"),
    );
    print(response.body);
    if (response.statusCode == 200) {
      vendors.removeWhere((element) => element.id == id);
      vendorDataSource =
          VendorDataSource(vendors: vendors, vendorprovider: this);
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
          "https://route-me2022.herokuapp.com/api/addVendor?server=${_serverController.text}&brandName=${_nameController.text}&email=${_emailController.text}&password=${_passwordController.text}&phone=${_phoneController.text}"),
    );
    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      getVendorsData(refresh: true);
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
    selectedVendors = vendors.firstWhere((element) => element.id == id);
    nameController.text = selectedVendors!.name;
    emailController.text = selectedVendors!.email;
    phoneController.text = selectedVendors!.phone;
    passwordController.text = selectedVendors!.password;
    serverController.text = selectedVendors!.server;

    editMode = true;
    notifyListeners();
  }

  disableEditMode() {
    selectedVendors = null;
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
          "https://route-me2022.herokuapp.com/api/updateUser?server=${_serverController.text}&brandName=${_nameController.text}&email=${_emailController.text}&password=${_passwordController.text}&phone=${_phoneController.text}&id=${selectedVendors!.id}&type=vendor"),
    );
    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      getVendorsData(refresh: true);
    }
    Fluttertoast.showToast(
        msg: data['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  uploadFile() async {
    print("HERE");
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      notifyListeners();
    }
  }
}
