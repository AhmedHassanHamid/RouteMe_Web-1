import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  double width;
  Color buttonColor;
  Color iconColor;
  IconData icon;
  VoidCallback onTap;

  DefaultIconButton({
    required this.width,
    required this.buttonColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: buttonColor,
        ),
        child: Center(
          child: Icon(
              icon,
            color: iconColor,
            size: width-20,
          ),
        ),
      ),
    );
  }
}
