import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  final double width;
  final double? size;
  final Color buttonColor;
  final Color iconColor;
  final IconData icon;
  final VoidCallback onTap;

  const DefaultIconButton({
    required this.width,
    this.size,
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
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: size ?? width - 10,
          ),
        ),
      ),
    );
  }
}
