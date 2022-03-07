import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web/styles/colors.dart';
import 'package:web/widgets/default_app_button.dart';

class TaskCard extends StatelessWidget {
  String task;
  String client;
  String order;
  String start;
  String end;

  TaskCard({
    required this.task,
    required this.client,
    required this.end,
    required this.order,
    required this.start,
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
                task,
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
                      'Order : ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      order,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start : ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      start,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),

                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'End : ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      end,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 5),
                child: DefaultAppButton(
                  onTap: (){},
                  text: 'Start Task',
                  height: 7.h,
                  backGround: AppColors.white,
                  fontSize: 17.sp,
                  textColor: AppColors.lightBlue,
                  width: 50.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
