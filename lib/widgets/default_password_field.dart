import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web/styles/colors.dart';

class DefaultPasswordField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  VoidCallback onTap;
  bool password;

  DefaultPasswordField({
    required this.controller,
    required this.hintText,
    required this.onTap,
    required this.password,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
      ),
      child: Container(
        width: 90.w,
        height: 10.h,
        margin: EdgeInsets.symmetric(
          vertical: 0.8.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
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
            hintStyle: TextStyle(
              fontSize: 12.sp,
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
