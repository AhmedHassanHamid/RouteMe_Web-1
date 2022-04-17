import 'package:flutter/material.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_password_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController confirm = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordVisible = true;
  bool confirmVisible = true;

  void showPassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void showConfirm() {
    setState(() {
      confirmVisible = !confirmVisible;
    });
  }

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
                        "Set Your New Password",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      DefaultPasswordField(
                        controller: password,
                        hintText: 'Password',
                        onTap: () => showPassword(),
                        password: passwordVisible,
                      ),
                      DefaultPasswordField(
                        controller: confirm,
                        hintText: 'Confirm Password',
                        onTap: () => showConfirm(),
                        password: confirmVisible,
                      ),
                      const SizedBox(
                        height: 10,
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
