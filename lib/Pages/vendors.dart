import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web/Model/vendors/vendor_provider.dart';

class Vendors extends StatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final vendorProvider = Provider.of<Vendorprovider>(context);
    vendorProvider.getVendorsData();
  }

  @override
  Widget build(BuildContext context) {
    final vendorProvider = Provider.of<Vendorprovider>(context);
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
                    "Vendors",
                    style: TextStyle(fontSize: 30, color: Color(0xffffffff)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.041,
                  ),
                  if (vendorProvider.showGrid)
                    SfDataGrid(
                      source: vendorProvider.vendorDataSource!,
                      columnWidthMode: ColumnWidthMode.fill,
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
                    )
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
              height: vendorProvider.editMode
                  ? MediaQuery.of(context).size.height * 0.85
                  : MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.34,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                children: [
                  Text(
                    vendorProvider.editMode ? "Edit Vendor" : "Add Vendor",
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
                      controller: vendorProvider.nameController,
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
                      controller: vendorProvider.emailController,
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
                      controller: vendorProvider.passwordController,
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
                      controller: vendorProvider.phoneController,
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
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Color(0xffE4E4E4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(vendorProvider.file != null
                                  ? vendorProvider.file!.path.split('/').last
                                  : 'selectImage')),
                        ),
                        Flexible(
                          flex: 1,
                          child: IconButton(
                            onPressed: () => vendorProvider.uploadFile(),
                            icon: Icon(Icons.attach_file),
                          ),
                        )
                      ],
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
                      controller: vendorProvider.serverController,
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
                      if (vendorProvider.editMode) {
                        vendorProvider.editUser();
                      } else {
                        vendorProvider.addUser();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                        vendorProvider.editMode ? 'edit' : 'Save',
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
                  if (vendorProvider.editMode)
                    ElevatedButton(
                      onPressed: () {
                        vendorProvider.disableEditMode();
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
