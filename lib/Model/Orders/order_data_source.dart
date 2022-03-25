import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'order.dart';

class OrderDataSource extends DataGridSource {
  OrderDataSource({required List<OrderModel> orders}) {
    _orders = orders
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'order name', value: e.orderName),
              DataGridCell<String>(
                  columnName: 'item count', value: e.itemCount),
              DataGridCell<String>(
                  columnName: 'client name', value: e.clientName),
              DataGridCell<String>(
                  columnName: 'client phone', value: e.clientPhone),
              DataGridCell<String>(
                  columnName: 'client location', value: e.clientLocation),
              DataGridCell<String>(
                  columnName: 'order price', value: e.orderPrice),
              DataGridCell<String>(columnName: 'vendor', value: e.vendor),
              DataGridCell<String>(columnName: 'branch', value: e.branch),
              DataGridCell<String>(columnName: 'comment', value: e.comment),
              DataGridCell<String>(columnName: 'state', value: e.state),
            ]))
        .toList();
    print(_orders.length);
  }

  List<DataGridRow> _orders = [];
  @override
  List<DataGridRow> get rows => _orders;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        width: 100,
        height: 70,
        decoration: BoxDecoration(color: Colors.white),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            e.value.toString(),
            style: TextStyle(
                color: e.columnName == "status" ? Colors.green : Colors.black),
          ),
        ),
      );
    }).toList());
  }
}
