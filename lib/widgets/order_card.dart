import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web/styles/colors.dart';

class OrderCard extends StatelessWidget {
  String order;
  String client;
  String phone;
  String branch;
  int count;
  String status;

  OrderCard({
    required this.order,
    required this.client,
    required this.status,
    required this.phone,
    required this.branch,
    required this.count,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
      child: Container(
        width: 100.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
          child: Column(
            children: [
              Text(
                order,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  children: [
                    Text(
                      'Client : ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      client,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  children: [
                    Text(
                      'Phone : ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  children: [
                    Text(
                      'Branch : ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      branch,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  children: [
                    Text(
                      'Count : ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  children: [
                    Text(
                      'Status : ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
