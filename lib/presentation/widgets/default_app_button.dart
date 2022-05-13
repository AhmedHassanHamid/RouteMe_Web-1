import 'package:flutter/material.dart';

class DefaultAppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  final double height;
  final Color backGround;
  final Color textColor;
  final double fontSize;

  const DefaultAppButton({
    required this.text,
    required this.backGround,
    required this.fontSize,
    required this.height,
    required this.onTap,
    required this.width,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backGround,
          borderRadius: BorderRadius.circular(10),
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
