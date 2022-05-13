import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/edit_user_cubit/edit_user_cubit.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/loading_dialog.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_text_field.dart';
import 'package:web/presentation/widgets/toast.dart';

// ignore: must_be_immutable
class EditUserDialog extends StatefulWidget {
  String name, email, phone, type;
  int id;

  EditUserDialog({
    required this.id,
    required this.type,
    required this.name,
    required this.email,
    required this.phone,
    Key? key,
  }) : super(key: key);

  @override
  State<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool passwordVisible = true;

  void showPassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void initState() {
    name.text = widget.name;
    email.text = widget.email;
    phone.text = widget.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<EditUserCubit, EditUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.transparent,
          body: Center(
            child: Container(
              width: 30.w,
              height: 50.h,
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
                          translate("edit"),
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
                      DefaultTextField(
                        controller: phone,
                        hintText: translate("phoneNum"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: DefaultAppButton(
                          text: translate('save'),
                          backGround: AppColors.darkPurple,
                          fontSize: 20,
                          height: 50,
                          onTap: () {
                            name.text == ''
                                ? showToast(translate('nameValidate'))
                                : email.text == ''
                                    ? showToast(translate('emailValidate'))
                                    : phone.text == ''
                                        ? showToast(translate('phoneValidate'))
                                        : {
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return const LoadingDialog();
                                              },
                                            ),
                                            widget.type == "driver"
                                                ? EditUserCubit.get(context)
                                                    .updateEmployee(
                                                    id: widget.id,
                                                    type: "driver",
                                                    name: name.text,
                                                    email: email.text,
                                                    phone: phone.text,
                                                  )
                                                : widget.type == "dispatcher"
                                                    ? EditUserCubit.get(context)
                                                        .updateEmployee(
                                                        id: widget.id,
                                                        type: "dispatcher",
                                                        name: name.text,
                                                        email: email.text,
                                                        phone: phone.text,
                                                      )
                                                    : EditUserCubit.get(context)
                                                        .updateVendor(
                                                        id: widget.id,
                                                        name: name.text,
                                                        email: email.text,
                                                        phone: phone.text,
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
