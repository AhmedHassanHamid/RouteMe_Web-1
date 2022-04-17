import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_icon_button.dart';

class Branches extends StatelessWidget {
  final String? branch;
  final String? phone;
  final VoidCallback? onTap;

  const Branches({
    required this.branch,
    required this.phone,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 100.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: AppColors.darkPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  branch!,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                  ),
                ),
                DefaultIconButton(
                  width: 5.h,
                  buttonColor: AppColors.white,
                  iconColor: AppColors.purple,
                  icon: Icons.phone,
                  onTap: () async {
                    var url = 'tel:$phone';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
