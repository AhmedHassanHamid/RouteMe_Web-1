import 'package:flutter/material.dart';
import 'package:web/Model/Drivers/driver.dart';
import 'package:web/Model/Drivers/driver_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Drivers extends StatefulWidget {
  const Drivers({Key? key}) : super(key: key);

  @override
  State<Drivers> createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  List<DriversModel> drivers = <DriversModel>[];
  late DriverDataSource driverDataSource;

  @override
  void initState() {
    super.initState();
    drivers = getDriversData();
    driverDataSource = DriverDataSource(drivers: drivers, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reebook'),
        centerTitle: true,
        backgroundColor: const Color(0xff00468B),
        leading: InkWell(
          onTap: () {
            // ignore: avoid_print
            print("....");
          },
          child: const Icon(Icons.settings),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff00468B),
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              height: MediaQuery.of(context).size.height * 0.72,
              width: MediaQuery.of(context).size.width * 0.51,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.043,
                  ),
                  const Text(
                    "Drivers",
                    style: TextStyle(fontSize: 30, color: Color(0xffffffff)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.041,
                  ),
                  SfDataGrid(
                    source: driverDataSource,
                    columnWidthMode: ColumnWidthMode.fill,
                    columns: <GridColumn>[
                      GridColumn(
                          columnName: 'status',
                          label: Container(
                              padding: EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              child: FittedBox(
                                child: Text(
                                  'Status',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),
                      GridColumn(
                          columnName: 'email',
                          label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: FittedBox(
                                  child: Text(
                                'Email',
                                style: TextStyle(color: Colors.white),
                              )))),
                      GridColumn(
                          columnName: 'name',
                          label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: FittedBox(
                                child: Text(
                                  'Name',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),
                      GridColumn(
                          columnName: 'phone',
                          label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: FittedBox(
                                child: Text(
                                  'Phone',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),
                      GridColumn(
                          columnName: 'action',
                          label: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: FittedBox(
                                child: Text(
                                  'Action',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff00468B),
                borderRadius: BorderRadius.circular(40),
              ),
              height: MediaQuery.of(context).size.height * 0.58,
              width: MediaQuery.of(context).size.width * 0.34,
            )
          ],
        ),
      ),
    );
  }

  List<DriversModel> getDriversData() {
    return [
      DriversModel("online", 'marian.adly', 'marian', "0122222222222",
          {"edit": true, "delete": true}),
      DriversModel("online", 'marian.adly', 'marian', "0122222222222",
          {"edit": true, "delete": true}),
      DriversModel("online", 'marian.adly', 'marian', "0122222222222",
          {"edit": true, "delete": true}),
      DriversModel("online", 'marian.adly', 'marian', "0122222222222",
          {"edit": true, "delete": true}),
      DriversModel("online", 'marian.adly', 'marian', "0122222222222",
          {"edit": true, "delete": true}),
      DriversModel("online", 'marian.adly', 'marian', "0122222222222",
          {"edit": true, "delete": true}),
    ];
  }
}
