import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_text_field.dart';
import 'package:web/presentation/widgets/toast.dart';

class VerifyScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  VerifyScreen({this.data, Key? key}) : super(key: key);

  final TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Image.asset(
                  'assets/images/Mask_Group_6.png',
                  height: 200,
                ),
                Image.asset(
                  'assets/images/Mask_Group_7.png',
                  height: 200,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        translate('enterCode'),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data['email'] ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.darkGray,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: code,
                        hintText: translate('code'),
                        width: 250,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultAppButton(
                        text: translate('verify'),
                        backGround: AppColors.darkPurple,
                        fontSize: 25,
                        height: 60,
                        onTap: () {
                          code.text == data['code']?
                          Navigator.pushNamed(context, '/reset',
                            arguments: {
                              'type': data['type'],
                              'userId': data['userId'],
                            },
                          ):
                          showToast(translate('codeValidate'));
                        },
                        width: 200,
                        textColor: AppColors.white,
                      ),
                    ],
                  ),
                ),
                const Image(
                  image: AssetImage(
                    "assets/images/Group_10.png",
                  ),
                  height: 250,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
