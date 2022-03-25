import 'package:flutter/material.dart';
import 'package:web/Model/Drivers/driver.dart';
import 'package:web/Model/vendors/vendor.dart';
import 'package:web/Model/vendors/vendor_provider.dart';
import 'package:web/Pages/vendors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VendorDataSource extends DataGridSource {
  VendorDataSource(
      {required List<VendorsModel> vendors, required this.vendorprovider}) {
    _vendors = vendors
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'status', value: e.status),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'phone', value: e.phone),
              DataGridCell<Map<String, dynamic>>(
                  columnName: 'actions', value: e.actions),
            ]))
        .toList();
  }

  List<DataGridRow> _vendors = [];
  Vendorprovider vendorprovider;

  @override
  List<DataGridRow> get rows => _vendors;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        decoration: const BoxDecoration(color: Colors.white),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: e.columnName == "actions"
            ? FittedBox(
                child: Row(
                  children: [
                    if (e.value['edit'])
                      FittedBox(
                          child: IconButton(
                              onPressed: () {
                                 vendorprovider                           
                                  .enableEditMode(e.value['id']);  
                              },
                              icon: const Icon(
                                Icons.edit,
                              ))),
                    if (e.value['delete'])
                      FittedBox(
                          child: IconButton(
                              onPressed: () {
                                vendorprovider.deleteUser(e.value['id']);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Color(0xffB50000),
                              ))),
                  ],
                ),
              )
            : Text(
                e.value.toString(),
                style: TextStyle(
                    color:
                        e.columnName == "status" ? Colors.green : Colors.black),
              ),
      );
    }).toList());
  }
}
