import 'package:flutter/material.dart';

class Vendors extends StatefulWidget {
  const Vendors({Key? key}) : super(key: key);

  @override
  State<Vendors> createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  @override
  Widget build(BuildContext context) {
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
}
