import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/dispatchers_cubit/dispatchers_cubit.dart';
import 'package:web/data/models/account_model.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/loading_dialog.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_password_field.dart';
import 'package:web/presentation/widgets/default_text_field.dart';
import 'package:web/presentation/widgets/toast.dart';

class AddDispatcherDialog extends StatefulWidget {
  const AddDispatcherDialog({Key? key}) : super(key: key);

  @override
  State<AddDispatcherDialog> createState() => _AddDispatcherDialogState();
}

class _AddDispatcherDialogState extends State<AddDispatcherDialog> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool passwordVisible = true;

  void showPassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<DispatchersCubit, List<AccountModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.transparent,
          body: state.isEmpty
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Center(
            child: Container(
              width: 30.w,
              height: 75.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Text(
                          translate("addDispatcher"),
                          style: const TextStyle(
                            color: AppColors.darkGray,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DefaultTextField(
                        controller: name,
                        hintText: translate("name"),
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
                      DefaultTextField(
                        controller: phone,
                        hintText: translate("phoneNum"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: DefaultAppButton(
                          text: translate('addDispatcher'),
                          backGround: AppColors.darkPurple,
                          fontSize: 20,
                          height: 50,
                          onTap: () {
                            name.text == '' ?
                            showToast(translate('nameValidate')):
                            email.text == '' ?
                            showToast(translate('emailValidate')):
                            password.text == '' ?
                            showToast(translate('passwordValidate')):
                            phone.text == '' ?
                            showToast(translate('phoneValidate')):
                            {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return const LoadingDialog();
                                },
                              ),
                              DispatchersCubit.get(context)
                                  .addNewDispatcher(
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                  phone: phone.text,
                                  afterSuccess: () => Navigator.pop(context)
                              ),
                            };
                          },
                          width: 15.w,
                          textColor: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
