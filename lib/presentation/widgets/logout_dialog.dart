import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/data/local/cache_helper.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          height: 25.h,
          width: 70.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.black,
            ),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  translate("wantLogout"),
                  style: const TextStyle(
                    color: AppColors.darkGray,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultAppButton(
                      text: translate("yes"),
                      backGround: AppColors.red,
                      fontSize: 20,
                      height: 7.h,
                      onTap: () {
                        CacheHelper.clearData();
                        Navigator.pushNamed(context, "/login");
                      },
                      width: 25.w,
                      textColor: AppColors.white,
                    ),
                    DefaultAppButton(
                      text: translate("no"),
                      backGround: AppColors.gray,
                      fontSize: 20,
                      height: 7.h,
                      onTap: () => Navigator.pop(context),
                      width: 25.w,
                      textColor: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
