import 'package:flutter/material.dart';
import 'package:route_me/Model/Dispatcher/dispatcher.dart';
import 'package:route_me/Model/Dispatcher/dispatcher_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DispatcherPage extends StatefulWidget {
  const DispatcherPage({Key? key}) : super(key: key);

  @override
  State<DispatcherPage> createState() => _DispatcherPageState();
}

class _DispatcherPageState extends State<DispatcherPage> {
  List<DispatcherModel> dispatchers = <DispatcherModel>[];
  late DispatcherDataSource dispatcherDataSource;

  @override
  void initState() {
    super.initState();
    dispatchers = getDispatcherData();
    dispatcherDataSource =
        DispatcherDataSource(dispatchers: dispatchers, context: context);
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
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                    vertical: MediaQuery.of(context).size.height * 0.02),
                width: MediaQuery.of(context).size.width * 0.51,
                child: Wrap(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.043,
                    ),
                    Center(
                      child: Text(
                        "Dispatchers",
                        style:
                            TextStyle(fontSize: 30, color: Color(0xffffffff)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.041,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SfDataGrid(
                        source: dispatcherDataSource,
                        columnWidthMode: ColumnWidthMode.fill,
                        shrinkWrapRows: true,
                        isScrollbarAlwaysShown: true,
                        verticalScrollPhysics:
                            const AlwaysScrollableScrollPhysics(),
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
                height: MediaQuery.of(context).size.height * 0.58,
                width: MediaQuery.of(context).size.width * 0.34,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.043,
                    ),
                    Text(
                      "Add Dispatchers",
                      style: TextStyle(fontSize: 30, color: Color(0xffffffff)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.041,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Color(0xffE4E4E4),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Name',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Color(0xffE4E4E4),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Email',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Color(0xffE4E4E4),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Phone',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Text(
                          'Save',
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
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

List<DispatcherModel> getDispatcherData() {
  return [
    DispatcherModel("online", 'marian adly1', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian adly1', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian adly1', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
    DispatcherModel("online", 'marian.adly', 'marian', "0122222222222",
        {"edit": true, "delete": true}),
  ];
}
