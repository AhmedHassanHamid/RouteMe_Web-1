import 'package:flutter/material.dart';
import 'package:web/Pages/dispatcher.dart';
import 'package:web/Pages/drivers.dart';
import 'package:web/home.dart';
import 'package:web/Pages/orders.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DispatcherPage(),
    );
  }
}
