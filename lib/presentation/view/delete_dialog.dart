import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/delete_user_cubit/delete_user_cubit.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({required this.id, required this.type, Key? key})
      : super(key: key);
  final String type;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          height: 20.h,
          width: 30.w,
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
              children: [
                InkWell(
                  child: const Icon(
                    Icons.close,
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                Center(
                  child: Text(
                    translate('wantDelete'),
                    style: const TextStyle(
                      fontSize: 25,
                      color: AppColors.darkGray,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultAppButton(
                      text: translate("yes"),
                      backGround: AppColors.red,
                      fontSize: 20,
                      height: 40,
                      onTap: () {
                        DeleteUserCubit.get(context).deleteUsers(
                          id: id,
                          type: type,
                        ).then((value) => Navigator.pop(context));
                      },
                      width: 10.w,
                      textColor: AppColors.white,
                    ),
                    DefaultAppButton(
                      text: translate("no"),
                      backGround: AppColors.darkGray,
                      fontSize: 20,
                      height: 40,
                      onTap: () => Navigator.pop(context),
                      width: 10.w,
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
