import 'package:flutter/material.dart';

class DefaultAppButton extends StatelessWidget {
  VoidCallback onTap;
  String text;
  double width;
  double height;
  Color backGround;
  Color textColor;
  double fontSize;
   DefaultAppButton({
    required this.text,
    required this.backGround,
    required this.fontSize,
    required this.height,
    required this.onTap,
     required this.width,
    required this.textColor,
  Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backGround,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
