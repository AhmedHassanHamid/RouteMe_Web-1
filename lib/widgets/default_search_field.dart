import 'package:flutter/material.dart';
import 'package:web/styles/colors.dart';

class DefaultSearchField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  VoidCallback onTap;
  double width;
  double height;

  DefaultSearchField({
    required this.controller,
    required this.hintText,
    required this.onTap,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
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
              icon: const Icon(Icons.search),
              onPressed: onTap,
            ),
          ),
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
        ),
      ),
    );
  }
}
