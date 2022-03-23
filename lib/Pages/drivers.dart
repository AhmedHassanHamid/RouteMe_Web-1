import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/Model/Drivers/driver.dart';
import 'package:web/Model/Drivers/driver_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web/Model/Drivers/driver_provider.dart';

class Drivers extends StatefulWidget {
  const Drivers({Key? key}) : super(key: key);

  @override
  State<Drivers> createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final driverProvider = Provider.of<DriverProvider>(context);
    driverProvider.getDriversData();
  }

  @override
  Widget build(BuildContext context) {
    final driverProvider = Provider.of<DriverProvider>(context);

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
                  if (driverProvider.showGrid)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SfDataGrid(
                        source: driverProvider.driverDataSource!,
                        columnWidthMode: ColumnWidthMode.fill,
                        shrinkWrapRows: true,
                        isScrollbarAlwaysShown: true,
                        verticalScrollPhysics:
                            const AlwaysScrollableScrollPhysics(),
                        columns: <GridColumn>[
                          GridColumn(
                              columnName: 'status',
                              label: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: const FittedBox(
                                    child: Text(
                                      'Status',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))),
                          GridColumn(
                              columnName: 'email',
                              label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const FittedBox(
                                      child: Text(
                                    'Email',
                                    style: TextStyle(color: Colors.white),
                                  )))),
                          GridColumn(
                              columnName: 'name',
                              label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const FittedBox(
                                    child: Text(
                                      'Name',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))),
                          GridColumn(
                              columnName: 'phone',
                              label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const FittedBox(
                                    child: Text(
                                      'Phone',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))),
                          GridColumn(
                              columnName: 'action',
                              label: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  child: const FittedBox(
                                    child: Text(
                                      'Action',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
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
              height: driverProvider.editMode
                  ? MediaQuery.of(context).size.height * 0.83
                  : MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.34,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.043,
                  ),
                  const Text(
                    "Add Drivers",
                    style: TextStyle(fontSize: 30, color: Color(0xffffffff)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.041,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: driverProvider.nameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: driverProvider.emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: driverProvider.passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: driverProvider.phoneController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone",
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: driverProvider.serverController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Server",
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (driverProvider.editMode) {
                        driverProvider.editUser();
                      } else {
                        driverProvider.addUser();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                        driverProvider.editMode ? 'edit' : 'Save',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  if (driverProvider.editMode)
                    ElevatedButton(
                      onPressed: () {
                        driverProvider.disableEditMode();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: const Text(
                          'clear',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
