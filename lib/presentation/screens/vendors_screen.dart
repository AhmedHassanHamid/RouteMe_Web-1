import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/vendor_cubit/vendors_cubit.dart';
import 'package:web/data/models/vendor_model.dart';
import 'package:web/presentation/view/add_vendor_dialog.dart';
import 'package:web/presentation/view/delete_dialog.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/edit_user_dialog.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_icon_button.dart';
import 'package:web/presentation/screens/drawer_screen.dart';
import 'package:web/presentation/widgets/toast.dart';

class VendorsScreen extends StatelessWidget {
  VendorsScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<VendorsCubit, List<VendorModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: _key,
          drawer: const DrawerScreen(),
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              translate('vendors'),
              style: const TextStyle(
                color: AppColors.darkGray,
                fontSize: 20,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
                top: 5,
                bottom: 5,
              ),
              child: InkWell(
                onTap: () => _key.currentState!.openDrawer(),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkPurple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 5,
                ),
                child: DefaultAppButton(
                  text: translate("addVendor"),
                  backGround: AppColors.darkPurple,
                  fontSize: 18,
                  height: 10,
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (_) {
                        return const AddVendorDialog();
                      },
                    );
                  },
                  width: 100,
                  textColor: AppColors.white,
                ),
              ),
            ],
            centerTitle: true,
          ),
          body: state.isEmpty
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : VendorsCubit.get(context).vendorResponse!.user!.isEmpty
              ? Center(
            child: Image.asset(
              "assets/images/noOrder.png",
              height: 150,
            ),
          )
              : SizedBox(
            width: 100.w,
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      DataTable(
                        showCheckboxColumn: false,
                        sortColumnIndex: 0,
                        sortAscending: true,
                        columns: [
                          DataColumn(
                            label: Text(
                              translate('id'),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              translate('name'),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              translate('email'),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              translate('phoneNum'),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              translate('actions'),
                            ),
                          ),
                        ],
                        rows: VendorsCubit.get(context)
                            .vendorResponse!
                            .user!
                            .map(
                              (data) => DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  data.id.toString(),
                                ),
                              ),
                              DataCell(
                                Text(
                                  data.name,
                                ),
                              ),
                              DataCell(
                                Text(
                                  data.email,
                                ),
                              ),
                              DataCell(
                                Text(
                                  data.phone,
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    DefaultIconButton(
                                      width: 35,
                                      buttonColor:
                                      AppColors.darkPurple,
                                      iconColor: AppColors.white,
                                      icon: Icons.edit,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return EditUserDialog(
                                              id: data.id,
                                              name: data.name,
                                              email: data.email,
                                              phone: data.phone,
                                              type: "vendor",
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    DefaultIconButton(
                                      width: 35,
                                      buttonColor:
                                      AppColors.red,
                                      iconColor: AppColors.white,
                                      icon: Icons.delete_outlined,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) {
                                            return DeleteDialog(
                                              id: data.id,
                                              type: data.type,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
