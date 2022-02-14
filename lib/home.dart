import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web/styles/colors.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController controller = TextEditingController();
final items = ['1','2','3','4'];
String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 80.h,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              width: 90.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      'ID'
                    ),
                    isExpanded: true,
                    iconSize: 20,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontSize: 20
      ),
    ),
  );
}
