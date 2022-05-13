import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/tasks_cubit/tasks_cubit.dart';
import 'package:web/business_logic/vendor_cubit/vendors_cubit.dart';
import 'package:web/data/models/vendor_model.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/loading_dialog.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_text_field.dart';
import 'package:web/presentation/widgets/toast.dart';


class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({Key? key}) : super(key: key);

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  TextEditingController orderNumber = TextEditingController();
  TextEditingController driverId = TextEditingController();
  TextEditingController driver = TextEditingController();
  TextEditingController dispatcherId = TextEditingController();
  TextEditingController clintName = TextEditingController();
  TextEditingController clintPhone = TextEditingController();
  TextEditingController itemCount = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController vendorId = TextEditingController();
  TextEditingController vendor = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController lon = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  TextEditingController comment = TextEditingController();
  TextEditingController status = TextEditingController();

  bool passwordVisible = true;

  void showPassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<VendorsCubit, List<VendorModel>>(
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
              height: 70.h,
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
                          translate("createTask"),
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
                        controller: orderNumber,
                        hintText: translate("taskId"),
                      ),
                      DefaultTextField(
                        controller: driverId,
                        hintText: translate("driverId"),
                      ),
                      DefaultTextField(
                        controller: driver,
                        hintText: translate("driver"),
                      ),
                      DefaultTextField(
                        controller: dispatcherId,
                        hintText: translate("dispatcherId"),
                      ),
                      DefaultTextField(
                        controller: clintName,
                        hintText: translate("clintName"),
                      ),
                      DefaultTextField(
                        controller: itemCount,
                        hintText: translate("itemCount"),
                      ),
                      DefaultTextField(
                        controller: price,
                        hintText: translate("price"),
                      ),
                      DefaultTextField(
                        controller: vendorId,
                        hintText: translate("vendorId"),
                      ),
                      DefaultTextField(
                        controller: vendor,
                        hintText: translate("vendor"),
                      ),
                      DefaultTextField(
                        controller: branch,
                        hintText: translate("branch"),
                      ),
                      DefaultTextField(
                        controller: lon,
                        hintText: translate("lon"),
                      ),
                      DefaultTextField(
                        controller: lat,
                        hintText: translate("lat"),
                      ),
                      DefaultTextField(
                        controller: address,
                        hintText: translate("address"),
                      ),
                      DefaultTextField(
                        controller: start,
                        hintText: translate("start"),
                      ),
                      DefaultTextField(
                        controller: end,
                        hintText: translate("end"),
                      ),
                      DefaultTextField(
                        controller: comment,
                        hintText: translate("comment"),
                      ),
                      DefaultTextField(
                        controller: status,
                        hintText: translate("status"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: DefaultAppButton(
                          text: translate('createTask'),
                          backGround: AppColors.darkPurple,
                          fontSize: 20,
                          height: 50,
                          onTap: () {
                            orderNumber.text == ''
                                ? showToast(
                                translate('orderNumberValidate'))
                                : driverId.text == ''
                                ? showToast(
                                translate('driverIdValidate'))
                                : driver.text == ''
                                ? showToast(
                                translate('driverValidate'))
                                : dispatcherId.text == ''
                                ? showToast(translate(
                                'dispatcherIdValidate'))
                                : clintName.text == ''
                                ? showToast(
                                translate('clintNameValidate'))
                                : itemCount.text == ''
                                ? showToast(
                                translate('itemCountValidate'))
                                : price.text == ''
                                ? showToast(
                                translate('priceValidate'))
                                : vendorId.text == ''
                                ? showToast(
                                translate('vendorIdValidate'))
                                : vendor.text == ''
                                ? showToast(
                                translate('vendorValidate'))
                                : branch.text == ''
                                ? showToast(
                                translate('branchValidate'))
                                : lon.text == ''
                                ? showToast(
                                translate('lonValidate'))
                                : lat.text == ''
                                ? showToast(
                                translate('latValidate'))
                                : address.text == ''
                                ? showToast(
                                translate('addressValidate'))
                                : start.text == ''
                                ? showToast(
                                translate('startValidate'))
                                : end.text == ''
                                ? showToast(
                                translate('endValidate'))
                                : comment.text == ''
                                ? showToast(
                                translate('commentValidate'))
                                : status.text == ''
                                ? showToast(
                                translate('statusValidate'))
                                : {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return const LoadingDialog();
                                },
                              ),
                              TasksCubit.get(context).createNewTask(
                                orderNumber: orderNumber.text,
                                driverId: driverId.text,
                                driver:driver.text,
                                dispatcherId: dispatcherId.text,
                                clintName: clintName.text,
                                clintPhone: clintPhone.text,
                                itemCount: itemCount.text,
                                price: price.text,
                                vendorId: vendorId.text,
                                vendor: vendor.text,
                                branch: branch.text,
                                lon: lon.text,
                                lat: lat.text,
                                address: address.text,
                                start: start.text,
                                end: end.text,
                                comment: comment.text,
                                status: status.text,
                                afterSuccess: () => Navigator.pop(context),
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