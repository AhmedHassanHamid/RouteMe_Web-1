import 'package:flutter/material.dart';
import 'package:web/Model/Dispatcher/dispatcher.dart';
import 'package:web/Model/Dispatcher/dispatcher_provider.dart';
import 'package:web/Pages/drivers.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DispatcherDataSource extends DataGridSource {
  DispatcherDataSource(
      {required List<DispatcherModel> dispatchers,
      required this.dispatcherProvider}) {
    _dispatchers = dispatchers
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

  List<DataGridRow> _dispatchers = [];
  Dispatcherprovider dispatcherProvider;
  
  @override
  List<DataGridRow> get rows => _dispatchers;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
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
                                dispatcherProvider
                                    .enableEditMode(e.value['id']);
                              },
                              icon: Icon(Icons.edit))),
                    if (e.value['delete'])
                      FittedBox(
                          child: IconButton(
                              onPressed: () {
                                print("Start delete");
                                dispatcherProvider.deleteUser(e.value['id']);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Color(0xffB50000),
                              ))),
                  ],
                ),
              )
            : FittedBox(
                child: Text(
                  e.value.toString(),
                  style: TextStyle(
                      color: e.columnName == "status"
                          ? Colors.green
                          : Colors.black),
                ),
              ),
      );
    }).toList());
  }
}
