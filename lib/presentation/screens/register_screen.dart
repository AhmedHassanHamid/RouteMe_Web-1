import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_password_field.dart';
import 'package:web/presentation/widgets/default_text_field.dart';
import 'package:web/presentation/view/loading_dialog.dart';
import 'package:web/presentation/widgets/toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController server = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController company = TextEditingController();
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
                  height: 500,
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
                        controller: company,
                        hintText: translate("company"),
                      ),
                      DefaultTextField(
                        controller: email,
                        hintText: translate("email"),
                      ),
                      DefaultTextField(
                        controller: phone,
                        hintText: translate("phoneNum"),
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
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultAppButton(
                        text: translate("register"),
                        backGround: AppColors.purple,
                        fontSize: 20,
                        height: 7.h,
                        width: 25.w,
                        textColor: AppColors.white,
                        onTap: () {
                          server.text == ''?
                          showToast(translate('serverValidate')):
                          company.text == ''?
                          showToast(translate('companyValidate')):
                          email.text == ''?
                          showToast(translate('emailValidate')):
                          phone.text == ''?
                          showToast(translate('phoneValidate')):
                          password.text == ''?
                          showToast(translate('passwordValidate')):
                          {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return const LoadingDialog();
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
                          Text(translate("haveAccount")),
                          InkWell(
                            child: Text(
                              translate("login"),
                              style: const TextStyle(
                                color: AppColors.purple,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed('/login');
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
