import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/drivers_cubit/drivers_cubit.dart';
import 'package:web/data/models/account_model.dart';
import 'package:web/presentation/view/add_driver_dialog.dart';
import 'package:web/presentation/view/delete_dialog.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/edit_user_dialog.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_icon_button.dart';
import 'package:web/presentation/screens/drawer_screen.dart';
import 'package:web/presentation/widgets/toast.dart';

class DriversScreen extends StatelessWidget {
  DriversScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
        key: _key,
        drawer: const DrawerScreen(),
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            translate('drivers'),
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
                text: translate("addDriver"),
                backGround: AppColors.darkPurple,
                fontSize: 18,
                height: 10,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return const AddDriverDialog();
                    },
                  );
                },
                textColor: AppColors.white,
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: BlocConsumer<DriversCubit, List<AccountModel>>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return DriversCubit.get(context).driverResponse!.user!.isEmpty
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
                                translate('state'),
                              ),
                            ),
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
                          rows: DriversCubit.get(context)
                              .driverResponse!
                              .user!
                              .map(
                                (data) => DataRow(
                              cells: [
                                DataCell(Container(
                                  decoration: BoxDecoration(
                                    color: data.status == "Online"
                                        ? AppColors.green
                                        : AppColors.red,
                                    borderRadius:
                                    BorderRadius.circular(50),
                                  ),
                                  width: 15,
                                  height: 15,
                                )),
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
                                                type: "driver",
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
                                        buttonColor: AppColors.red,
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
            );
          },
        ));
  }
}