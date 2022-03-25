import 'package:flutter/material.dart';
import 'package:web/styles/colors.dart';

class DefaultPasswordField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  VoidCallback onTap;
  bool password;
  double width;
  double height;

  DefaultPasswordField({
    required this.controller,
    required this.hintText,
    required this.onTap,
    required this.password,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          cursorColor: AppColors.blue,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: IconButton(
                icon: Icon(password ? Icons.visibility_off : Icons.visibility),
                onPressed: onTap,
              ),
            ),
            alignLabelWithHint: true,
            hintStyle: const TextStyle(
              fontSize: 20,
            ),
            filled: true,
            fillColor: AppColors.lightGray,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
          ),
          obscureText: password,
        ),
      ),
    );
  }
}
