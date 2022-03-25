import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web/Model/Dispatcher/dispatcher_provider.dart';
import 'package:web/Model/Orders/order_provider.dart';
import 'package:web/Model/vendors/vendor_provider.dart';
import 'package:web/Pages/login.dart';
import 'Model/Drivers/driver_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Dispatcherprovider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => Vendorprovider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => DriverProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Route Me',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
