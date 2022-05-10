import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:web/business_logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/loading_dialog.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_password_field.dart';
import 'package:web/presentation/widgets/toast.dart';

class ResetPasswordScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const ResetPasswordScreen({this.data, Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController confPassword = TextEditingController();
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
    fToast.init(context);
    return BlocProvider(
      create: ((context) => ResetPasswordCubit()),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.darkPurple,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.ltr,
                    children: const [
                      Image(
                        image: AssetImage(
                          "assets/images/Mask_Group_6.png",
                        ),
                        height: 200,
                      ),
                      Image(
                        image: AssetImage(
                          "assets/images/Mask_Group_7.png",
                        ),
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
                              translate('resetPassword'),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            DefaultPasswordField(
                              controller: password,
                              hintText: translate('password'),
                              onTap: () => showPassword(),
                              password: passwordVisible,
                            ),
                            DefaultPasswordField(
                              controller: confPassword,
                              hintText: translate('passwordConf'),
                              onTap: () => showConfirm(),
                              password: confirmVisible,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultAppButton(
                              text: translate('reset'),
                              backGround: AppColors.darkPurple,
                              fontSize: 20,
                              height: 50,
                              onTap: () {
                                password.text == '' || confPassword.text == ''
                                    ? showToast(translate("passwordValidate"))
                                    : confPassword.text != password.text
                                    ? showToast(translate("matchPassword"))
                                    : {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return const LoadingDialog();
                                    },
                                  ),
                                  ResetPasswordCubit.get(context)
                                      .reset(
                                      id: widget.data['userId'].toString(),
                                      type: widget.data['type'],
                                      password: password.text,
                                      afterSuccess: (){
                                        Navigator.pushNamed(
                                          context,
                                          '/login',
                                        );
                                      },
                                      afterFail: () => Navigator.pop(context)
                                  )
                                };
                              },
                              width: 250,
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
        },
      ),
    );
  }
}
