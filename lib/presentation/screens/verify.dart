import 'package:flutter/material.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_text_field.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController code = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Image(
                  image: AssetImage(
                    "assets/Mask_Group_6.png",
                  ),
                ),
                Image(
                  image: AssetImage(
                    "assets/Mask_Group_7.png",
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  width: 500,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Please Enter the Verification Code that was Sent to you via",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "example@gmail.com",
                          style: TextStyle(
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
                        hintText: 'Verification Code',
                        width: 400,
                        height: 60,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DefaultAppButton(
                        text: 'Reset',
                        backGround: AppColors.darkPurple,
                        fontSize: 25,
                        height: 60,
                        onTap: () {},
                        width: 300,
                        textColor: AppColors.white,
                      ),
                    ],
                  ),
                ),
                const Image(
                  image: AssetImage(
                    "assets/Group_10.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
