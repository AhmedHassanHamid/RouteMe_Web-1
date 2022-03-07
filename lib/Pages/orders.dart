import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
