import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/tasks_cubit/tasks_cubit.dart';
import 'package:web/data/models/task_model.dart';
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
  int? orderNumber;
  int? index;
  int? driverIndex;
  int? start;
  int? end;
  String? whenStart;
  String? whenEnd;
  String? driverName;
  String? status;
  String com = '';
  List<int> times = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<String> when = ['AM', 'PM'];
  TextEditingController driverId = TextEditingController();
  TextEditingController clientName = TextEditingController();
  TextEditingController clientPhone = TextEditingController();
  TextEditingController itemCount = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController vendorId = TextEditingController();
  TextEditingController vendor = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController lon = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<TasksCubit, List<TaskModel>>(
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
                    height: 85.h,
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
                            TasksCubit.get(context).orderResponse!.orders!.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: 1.h,
                                    ),
                                    child: Container(
                                      width: 80.w,
                                      height: 7.7.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightGray,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          top: 5,
                                        ),
                                        child: DropdownButton<int>(
                                          value: orderNumber,
                                          underline: const SizedBox(),
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 36,
                                          ),
                                          hint: Text(
                                            translate("orderId"),
                                          ),
                                          isExpanded: true,
                                          elevation: 1,
                                          style: const TextStyle(
                                            color: AppColors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          onChanged: (int? value) {
                                            setState(() {
                                              clientName.text = '';
                                              clientPhone.text = '';
                                              itemCount.text = '';
                                              price.text = '';
                                              vendorId.text = '';
                                              lon.text = '';
                                              lat.text = '';
                                              address.text = '';
                                              vendor.text = '';
                                              branch.text = '';
                                              comment.text = '';
                                              com = '';
                                              index = TasksCubit.get(context)
                                                  .orderNumbers
                                                  .indexOf(value!);
                                              orderNumber = value;
                                              clientName.text =
                                                  TasksCubit.get(context)
                                                      .orderResponse!
                                                      .orders![index!]
                                                      .clientName;
                                              clientPhone.text =
                                                  TasksCubit.get(context)
                                                      .orderResponse!
                                                      .orders![index!]
                                                      .clientPhone;
                                              itemCount.text =
                                                  TasksCubit.get(context)
                                                      .orderResponse!
                                                      .orders![index!]
                                                      .itemCount
                                                      .toString();
                                              price.text =
                                                  TasksCubit.get(context)
                                                      .orderResponse!
                                                      .orders![index!]
                                                      .price
                                                      .toString();
                                              vendorId.text =
                                                  TasksCubit.get(context)
                                                      .orderResponse!
                                                      .orders![index!]
                                                      .vendorId
                                                      .toString();
                                              lon.text = TasksCubit.get(context)
                                                  .orderResponse!
                                                  .orders![index!]
                                                  .lon
                                                  .toString();
                                              lat.text = TasksCubit.get(context)
                                                  .orderResponse!
                                                  .orders![index!]
                                                  .lat
                                                  .toString();
                                              address.text =
                                                  TasksCubit.get(context)
                                                      .orderResponse!
                                                      .orders![index!]
                                                      .address;
                                              vendor.text =
                                                  TasksCubit.get(context)
                                                      .orderResponse!
                                                      .orders![index!]
                                                      .vendor;
                                              branch.text =
                                                  TasksCubit.get(context)
                                                      .orderResponse!
                                                      .orders![index!]
                                                      .branch;
                                              com = TasksCubit.get(context)
                                                  .orderResponse!
                                                  .orders![index!]
                                                  .comment;
                                              status = TasksCubit.get(context)
                                                  .orderResponse!
                                                  .orders![index!]
                                                  .state;
                                            });
                                          },
                                          items: TasksCubit.get(context)
                                              .orderNumbers
                                              .map<DropdownMenuItem<int>>(
                                                  (value) {
                                            return DropdownMenuItem<int>(
                                              value: value,
                                              child: Text(value.toString()),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                            TasksCubit.get(context).driverResponse!.user!.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: 1.h,
                                    ),
                                    child: Container(
                                      width: 80.w,
                                      height: 7.7.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightGray,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          top: 5,
                                        ),
                                        child: DropdownButton<String>(
                                          value: driverName,
                                          underline: const SizedBox(),
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 36,
                                          ),
                                          hint: Text(
                                            translate("driver"),
                                          ),
                                          isExpanded: true,
                                          elevation: 1,
                                          style: const TextStyle(
                                            color: AppColors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          onChanged: (String? value) {
                                            setState(() {
                                              driverIndex =
                                                  TasksCubit.get(context)
                                                      .driversName
                                                      .indexOf(value!);
                                              driverName = value;
                                              driverId.text =
                                                  TasksCubit.get(context)
                                                      .driverResponse!
                                                      .user![driverIndex!]
                                                      .id
                                                      .toString();
                                            });
                                          },
                                          items: TasksCubit.get(context)
                                              .driversName
                                              .map<DropdownMenuItem<String>>(
                                                  (value) {
                                            return DropdownMenuItem<String>(
                                              value: value.toString(),
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                            DefaultTextField(
                              controller: driverId,
                              hintText: translate("driverId"),
                            ),
                            DefaultTextField(
                              controller: clientName,
                              hintText: translate("clientName"),
                            ),
                            DefaultTextField(
                              controller: clientPhone,
                              hintText: translate("clientPhone"),
                            ),
                            DefaultTextField(
                              controller: itemCount,
                              hintText: translate("itemCount"),
                            ),
                            DefaultTextField(
                              controller: price,
                              hintText: translate("total"),
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
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        translate("start"),
                                        style: const TextStyle(
                                          color: AppColors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        translate("end"),
                                        style: const TextStyle(
                                          color: AppColors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 1.h,
                                        ),
                                        child: Container(
                                          width: 120,
                                          height: 5.7.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGray,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 12,
                                              right: 12,
                                              top: 5,
                                            ),
                                            child: DropdownButton<int>(
                                              value: start,
                                              underline: const SizedBox(),
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 36,
                                              ),
                                              hint: Text(
                                                translate("hour"),
                                              ),
                                              isExpanded: true,
                                              elevation: 1,
                                              style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              onChanged: (int? value) {
                                                setState(() {
                                                  start = value;
                                                });
                                              },
                                              items: times.map<
                                                      DropdownMenuItem<
                                                          int>>((value) {
                                                return DropdownMenuItem<int>(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 1.h,
                                        ),
                                        child: Container(
                                          width: 120,
                                          height: 5.7.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGray,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 12,
                                              right: 12,
                                              top: 5,
                                            ),
                                            child: DropdownButton<int>(
                                              value: end,
                                              underline: const SizedBox(),
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 36,
                                              ),
                                              hint: Text(
                                                translate("hour"),
                                              ),
                                              isExpanded: true,
                                              elevation: 1,
                                              style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              onChanged: (int? value) {
                                                setState(() {
                                                  end = value;
                                                });
                                              },
                                              items: times.map<
                                                  DropdownMenuItem<
                                                      int>>((value) {
                                                return DropdownMenuItem<int>(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 1.h,
                                        ),
                                        child: Container(
                                          width: 120,
                                          height: 5.7.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGray,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 12,
                                              right: 12,
                                              top: 5,
                                            ),
                                            child: DropdownButton<String>(
                                              value: whenStart,
                                              underline: const SizedBox(),
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 36,
                                              ),
                                              hint: Text(
                                                translate("shift"),
                                              ),
                                              isExpanded: true,
                                              elevation: 1,
                                              style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  whenStart = value;
                                                });
                                              },
                                              items: when.map<
                                                  DropdownMenuItem<
                                                      String>>((value) {
                                                return DropdownMenuItem<String>(
                                                  value: value.toString(),
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 1.h,
                                        ),
                                        child: Container(
                                          width: 120,
                                          height: 5.7.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGray,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 12,
                                              right: 12,
                                              top: 5,
                                            ),
                                            child: DropdownButton<String>(
                                              value: whenEnd,
                                              underline: const SizedBox(),
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 36,
                                              ),
                                              hint: Text(
                                                translate("shift"),
                                              ),
                                              isExpanded: true,
                                              elevation: 1,
                                              style: const TextStyle(
                                                color: AppColors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  whenEnd = value;
                                                });
                                              },
                                              items: when.map<
                                                      DropdownMenuItem<
                                                          String>>((value) {
                                                return DropdownMenuItem<String>(
                                                  value: value.toString(),
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                            DefaultTextField(
                              controller: comment,
                              hintText: com == ''
                                  ? translate("comment")
                                  : translate(com),
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
                                  driverId.text == '' ?
                                  showToast(translate('driverIdValidate')) :
                                  driverName == '' ?
                                  showToast(translate('driverValidate')) :
                                  clientName.text == '' ?
                                  showToast(translate('clientNameValidate')) :
                                  itemCount.text == '' ?
                                  showToast(translate('itemCountValidate')) :
                                  price.text == '' ?
                                  showToast(translate('priceValidate')) :
                                  vendorId.text == '' ?
                                  showToast(translate('vendorIdValidate')) :
                                  vendor.text == '' ?
                                  showToast(translate('vendorValidate')) :
                                  branch.text == '' ?
                                  showToast(translate('branchValidate')) :
                                  lon.text == '' ?
                                  showToast(translate('lonValidate')) :
                                  lat.text == '' ?
                                  showToast(translate('latValidate')) :
                                  address.text == '' ?
                                  showToast(translate('addressValidate')) :
                                  {
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        return const LoadingDialog();
                                      },
                                    ),
                                    TasksCubit.get(context).createNewTask(
                                      orderNumber: orderNumber.toString(),
                                      driverId: driverId.text,
                                      driver: driverName.toString(),
                                      clientName: clientName.text,
                                      clientPhone: clientPhone.text,
                                      itemCount: itemCount.text,
                                      price: price.text,
                                      vendorId: vendorId.text,
                                      vendor: vendor.text,
                                      branch: branch.text,
                                      lon: lon.text,
                                      lat: lat.text,
                                      address: address.text,
                                      start: start.toString() + ' ' + whenStart.toString(),
                                      end: end.toString() + ' ' + whenEnd.toString(),
                                      comment: comment.text == ''?com:comment.text,
                                      status: status.toString(),
                                      afterSuccess: () => Navigator.pushNamed(context, '/tasksMap'),
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
