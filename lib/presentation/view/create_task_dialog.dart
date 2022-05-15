import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
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
  String dropdownValue = 'AM';
  List<int> time =[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  int SelectedTime= 1;
  String con = '';
  String dropdownValuee = 'Task No.';
  String drop = 'Driver Name';


  void getDropDownItem(){

    setState(() { con = '$SelectedTime';}
      );
  }


  TextEditingController driverId = TextEditingController();
  TextEditingController driver = TextEditingController();
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
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  TextEditingController comment = TextEditingController();


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
                   DropdownButton<String>(
              value: dropdownValuee,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValuee = newValue!;
                });
              },
              items: <String>['Task No.','ali', 'moh']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
                      DefaultTextField(
                        controller: driverId,
                        hintText: translate("driverId"),
                      ),
                      DropdownButton<String>(
                        value: drop,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            drop = newValue!;
                          });
                        },
                        items: <String>['Driver Name','ali', 'moh']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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

                      DefaultTextField(
                        controller: address,
                        hintText: translate("start"),


                      ),
                     Row(
                       children: [
                         Text('Start Task   ', textAlign: TextAlign.left),
                         DropdownButton<int>(

                        value: SelectedTime,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),

                        onChanged: (newValue) {
                          setState(() {
                            SelectedTime = newValue!;
                          });
                        },
                        items: time.map((time){
                          return DropdownMenuItem(
                              child: Text(time.toString()),
                            value: time,
                          );
                        }).toList(),
                        
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),

                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['AM', 'PM'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }
                        ).toList(),
                      ),

                       ]

                     ),

                      DefaultTextField(
                        controller: end,
                        hintText: translate("end"),
                      ),

                      Row(
                          children: [
                            Text('End Task    ', textAlign: TextAlign.left),
                            DropdownButton<int>(
                            value: SelectedTime,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),

                            onChanged: (newValue) {
                              setState(() {
                                SelectedTime = newValue!;
                              });
                            },
                            items: time.map((time){
                              return DropdownMenuItem(
                                child: Text(time.toString()),
                                value: time,
                              );
                            }).toList(),

                          ),
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),

                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>['AM', 'PM'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }
                              ).toList(),
                            ),]
                      ),
                      DefaultTextField(
                        controller: comment,
                        hintText: translate("comment"),
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
                            driverId.text == ''
                                ? showToast(
                                translate('driverIdValidate'))
                                : driver.text == ''
                                ? showToast(
                                translate('driverValidate'))
                                : clientName.text == ''
                                ? showToast(
                                translate('clientNameValidate'))
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
                                : {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return const LoadingDialog();
                                },
                              ),
                              TasksCubit.get(context).createNewTask(

                                driverId: driverId.text,
                                driver:driver.text,
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

                                start: start.text,
                                end: end.text,
                                comment: comment.text,

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