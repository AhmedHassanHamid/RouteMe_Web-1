import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web/Model/Orders/order.dart';
import 'package:web/Model/Orders/order_data_source.dart';
import 'package:web/Model/Orders/order_provider.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final orderProvider = Provider.of<OrderProvider>(context);
    orderProvider.getOrdersData();
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Reebook'),
        centerTitle: true,
        backgroundColor: Color(0xff00468B),
        leading: InkWell(
          onTap: () {
            print("....");
          },
          child: Icon(Icons.settings),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff00468B),
            borderRadius: BorderRadius.circular(40),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.02),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Wrap(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.043,
              ),
              Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  const Text(
                    "Orders",
                    style: TextStyle(fontSize: 30, color: Color(0xffffffff)),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        color: const Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: orderProvider.controller,
                      onFieldSubmitted: (v) {
                        orderProvider.getOrdersData(refresh: true);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.041,
              ),
              if (orderProvider.showGrid)
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SfDataGrid(
                    source: orderProvider.orderDataSource!,
                    columnWidthMode: ColumnWidthMode.fill,
                    shrinkWrapRows: true,
                    isScrollbarAlwaysShown: true,
                    verticalScrollPhysics:
                        const AlwaysScrollableScrollPhysics(),
                    columns: <GridColumn>[
                      GridColumn(
                          columnName: 'order name',
                          label: Container(
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              child: const FittedBox(
                                child: Text(
                                  'order name',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),
                      GridColumn(
                          columnName: 'item count',
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const FittedBox(
                              child: Text(
                                'item count',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                      GridColumn(
                          columnName: 'client name',
                          label: Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: const FittedBox(
                                child: Text(
                                  'client name',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),
                      GridColumn(
                          columnName: 'client phone',
                          label: Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: const FittedBox(
                                child: Text(
                                  'client phone',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))),
                      GridColumn(
                        columnName: 'client location',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const FittedBox(
                            child: Text(
                              'client location',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'order price',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const FittedBox(
                            child: Text(
                              'order price',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'vendor',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const FittedBox(
                            child: Text(
                              'vendor',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'branch',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const FittedBox(
                            child: Text(
                              'branch',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'comment',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const FittedBox(
                            child: Text(
                              'comment',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'state',
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: const FittedBox(
                            child: Text(
                              'state',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
