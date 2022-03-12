import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web/Model/Drivers/driver_data_source.dart';
import 'package:web/Pages/drivers.dart';

import 'driver.dart';
import 'package:http/http.dart' as http;

class DriversProvider with ChangeNotifier {
  List<DriversModel> drivers = <DriversModel>[];
  late DriverDataSource? driverDataSource;
  bool showGrid = false;
  getDriversData() async {
    if (drivers.isNotEmpty) {
      return;
    }
    final response = await http.post(
      Uri.parse(
        "https://route-me2022.herokuapp.com/api/getUsers?type=driver",
      ),
    );
    if (response.statusCode == 200) {
      print(response.body);
      final List data = json.decode(response.body);
      data.forEach((element) {
        drivers.add(DriversModel.fromJson(element));
      });
 driverDataSource = DriverDataSource(
          drivers: drivers, driverProvider: this);
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
      driverDataSource = DriverDataSource(
          drivers: drivers, driverProvider: this);
      notifyListeners();
    }
  }
}