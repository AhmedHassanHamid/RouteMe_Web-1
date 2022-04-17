import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web/presentation/styles/colors.dart';

class OrderCard extends StatelessWidget {
  final int order;
  final String status;
  final VoidCallback onTap;

  const OrderCard({
    required this.order,
    required this.status,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
          bottom: 5,
        ),
        child: Container(
          width: 100.w,
          height: 7.h,
          decoration: BoxDecoration(
            color: AppColors.darkPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 3,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
