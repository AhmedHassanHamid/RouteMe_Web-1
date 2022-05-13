import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web/presentation/styles/colors.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double? width;
  final double? height;
  final int? maxLine;
  const DefaultTextField({
    required this.controller,
    required this.hintText,
    this.width,
    this.height,
    this.maxLine,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
      ),
      child: Container(
        width: width ?? 90.w,
        height: height ?? 7.h,
        margin: EdgeInsets.symmetric(
          vertical: 0.5.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 18,
          ),
          cursorColor: AppColors.purple,
          maxLines: maxLine ?? 1,
          decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            hintStyle: const TextStyle(
              fontSize: 15,
            ),
            filled: true,
            fillColor: AppColors.lightGray,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
