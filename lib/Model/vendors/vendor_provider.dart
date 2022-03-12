import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web/Model/vendors/vendor.dart';
import 'package:web/Model/vendors/vendor_data_source.dart';
import 'package:http/http.dart' as http;

class Vendorprovider with ChangeNotifier {
  List<VendorsModel> vendors = <VendorsModel>[];
  late VendorDataSource? vendorDataSource;
  bool showGrid = false;
  getVendorsData() async {
    if (vendors.isNotEmpty) {
      return;
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
}
