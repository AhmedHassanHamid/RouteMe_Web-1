import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/language_cubit/language_cubit.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          height: 30.h,
          width: 65.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.black,
            ),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: const Icon(
                    Icons.close,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                Center(
                  child: Text(
                    translate('languages'),
                    style: const TextStyle(
                      fontSize: 25,
                      color: AppColors.darkGray,
                    ),
                  ),
                ),
                Center(
                  child: DefaultAppButton(
                    text: "العربية",
                    backGround: AppColors.darkPurple,
                    fontSize: 20,
                    height: 40,
                    onTap: () {
                      LanguageCubit.get(context).toArabic(
                        afterSuccess: () => Navigator.pop(context)
                      );
                    },
                    width: 40.w,
                    textColor: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: DefaultAppButton(
                    text: "English",
                    backGround: AppColors.darkPurple,
                    fontSize: 20,
                    height: 40,
                    onTap: () {
                      LanguageCubit.get(context).toEnglish(
                          afterSuccess: () => Navigator.pop(context)
                      );
                    },
                    width: 40.w,
                    textColor: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
