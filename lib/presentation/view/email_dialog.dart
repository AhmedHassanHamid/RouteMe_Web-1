import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/verify_cubit/verify_cubit.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/loading_dialog.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_text_field.dart';
import 'package:web/presentation/widgets/toast.dart';

class EmailDialog extends StatelessWidget {
  EmailDialog({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          height: 25.h,
          width: 80.w,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultTextField(
                  controller: email,
                  hintText: translate("email"),
                  width: 70.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultAppButton(
                      text: translate("continue"),
                      backGround: AppColors.darkPurple,
                      fontSize: 20,
                      height: 7.h,
                      width: 35.w,
                      textColor: AppColors.white,
                      onTap: () {
                        Random random = Random();
                        int code = random.nextInt(999999) + 100000;
                        email.text == ''
                            ? showToast(translate('emailValidate'))
                            : {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return const LoadingDialog();
                                  },
                                ),
                                VerifyCubit.get(context).verifyCode(
                                  email: email.text,
                                  code: code.toString(),
                                  afterSuccess: () => Navigator.pushNamed(
                                    context,
                                    "/verify",
                                    arguments: {
                                      'email': email.text,
                                      'code': code.toString(),
                                      'type': VerifyCubit.get(context)
                                          .verifyResponse!
                                          .type,
                                      'userId': VerifyCubit.get(context)
                                          .verifyResponse!
                                          .id,
                                    },
                                  ),
                                  afterFail: () => Navigator.pop(context),
                                ),
                              };
                      },
                    ),
                    DefaultAppButton(
                      text: translate("cancel"),
                      backGround: AppColors.gray,
                      fontSize: 20,
                      height: 7.h,
                      onTap: () => Navigator.pop(context),
                      width: 35.w,
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
