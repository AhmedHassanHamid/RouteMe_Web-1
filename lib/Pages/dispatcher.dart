import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web/Model/Dispatcher/dispatcher_provider.dart';

class DispatcherPage extends StatefulWidget {
  const DispatcherPage({Key? key}) : super(key: key);

  @override
  State<DispatcherPage> createState() => _DispatcherPageState();
}

class _DispatcherPageState extends State<DispatcherPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dispatcherProvider = Provider.of<Dispatcherprovider>(context);
    dispatcherProvider.getDispatcherData();
  }

  @override
  Widget build(BuildContext context) {
    final dispatcherProvider = Provider.of<Dispatcherprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reebook'),
        centerTitle: true,
        backgroundColor: const Color(0xff00468B),
        leading: InkWell(
          onTap: () {
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
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.02),
              width: MediaQuery.of(context).size.width * 0.51,
              child: Wrap(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.043,
                  ),
                  const Center(
                    child: Text(
                      "Dispatchers",
                      style: TextStyle(fontSize: 30, color: Color(0xffffffff)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.041,
                  ),
                  if (dispatcherProvider.showGrid)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SfDataGrid(
                        source: dispatcherProvider.dispatcherDataSource!,
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
                color: Color(0xff00468B),
                borderRadius: BorderRadius.circular(40),
              ),
              height: dispatcherProvider.editMode
                  ? MediaQuery.of(context).size.height * 0.75
                  : MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.34,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                children: [
                  Text(
                    "Add Dispatchers",
                    style: TextStyle(fontSize: 30, color: Color(0xffffffff)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: dispatcherProvider.nameController,
                      decoration: InputDecoration(
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
                        color: Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: dispatcherProvider.emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
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
                        color: Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: dispatcherProvider.passwordController,
                      decoration: InputDecoration(
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
                        color: Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: dispatcherProvider.phoneController,
                      decoration: InputDecoration(
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
                        color: Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: dispatcherProvider.serverController,
                      decoration: InputDecoration(
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
                      if (dispatcherProvider.editMode) {
                        dispatcherProvider.editUser();
                      } else {
                        dispatcherProvider.addUser();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                        dispatcherProvider.editMode ? 'edit' : 'Save',
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  if (dispatcherProvider.editMode)
                    ElevatedButton(
                      onPressed: () {
                        dispatcherProvider.disableEditMode();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
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
