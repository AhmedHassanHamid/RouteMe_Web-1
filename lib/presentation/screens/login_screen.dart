import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/login_cubit/login_cubit.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_password_field.dart';
import 'package:web/presentation/widgets/default_text_field.dart';
import 'package:web/presentation/screens/loading_dialog.dart';
import 'package:web/presentation/widgets/toast.dart';

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

  void showPassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: const [
                Image(
                  image: AssetImage(
                    "assets/images/Mask_Group_6.png",
                  ),
                ),
                Image(
                  image: AssetImage(
                    "assets/images/Mask_Group_7.png",
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 400,
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      DefaultTextField(
                        controller: server,
                        hintText: translate("server"),
                      ),
                      DefaultTextField(
                        controller: email,
                        hintText: translate("email"),
                      ),
                      DefaultPasswordField(
                        password: passwordVisible,
                        controller: password,
                        icon: IconButton(
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: showPassword,
                        ),
                        hintText: translate("password"),
                        submit: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/verify');
                            },
                            child: Text(
                              translate("forget"),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultAppButton(
                        text: translate("login"),
                        backGround: AppColors.purple,
                        fontSize: 20,
                        height: 7.h,
                        width: 25.w,
                        textColor: AppColors.white,
                        onTap: () {
                          server.text == ''?
                          showToast(translate('serverValidate')):
                          email.text == ''?
                          showToast(translate('emailValidate')):
                          password.text == ''?
                          showToast(translate('passwordValidate')):
                          {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return const LoadingDialog();
                              },
                            ),
                            LoginCubit.get(context)
                                .userLogin(
                              server: server.text,
                              email: email.text,
                              password: password.text,
                              afterSuccess: (){

                              },
                              afterFail: (){
                                Navigator.pop(context);
                              },
                            )
                          };
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(translate("dHaveAccount")),
                          InkWell(
                            child: Text(
                              translate("register"),
                              style: const TextStyle(
                                color: AppColors.purple,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                          )
                        ],
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
