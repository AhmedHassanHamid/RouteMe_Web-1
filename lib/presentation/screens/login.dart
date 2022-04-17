import 'package:flutter/material.dart';
import 'package:web/data/models/account_model.dart';
import 'package:web/data/network/responses/login_response.dart';
import 'package:web/presentation/screens/register.dart';
import 'package:web/presentation/screens/verify.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_password_field.dart';
import 'package:web/presentation/widgets/default_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController server = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordVisible = true;
  List<AccountModel> drivers = <AccountModel>[];
  LoginResponse? login;

  void showPassword() {
    setState(() {
      passwordVisible = !passwordVisible;
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
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      DefaultTextField(
                        controller: server,
                        hintText: 'Server Name',
                        width: 400,
                        height: 50,
                      ),
                      DefaultTextField(
                        controller: email,
                        hintText: 'E-Mail',
                        width: 400,
                        height: 50,
                      ),
                      DefaultPasswordField(
                        controller: password,
                        hintText: 'Password',
                        onTap: () => showPassword(),
                        password: passwordVisible,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          child: const Text(
                            "Forget Password..?",
                            style: TextStyle(
                              color: AppColors.purple,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VerifyScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultAppButton(
                        text: 'Login',
                        backGround: AppColors.darkPurple,
                        fontSize: 25,
                        height: 60,
                        onTap: () async {},
                        width: 300,
                        textColor: AppColors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't Have An Account? "),
                          InkWell(
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: AppColors.purple,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                          )
                        ],
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
