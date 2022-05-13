import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/business_logic/tasks_cubit/tasks_cubit.dart';
import 'package:web/data/models/task_model.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/view/loading_dialog.dart';
import 'package:web/presentation/view/task_details_dialog.dart';
import 'package:web/presentation/widgets/default_icon_button.dart';
import 'package:web/presentation/widgets/default_search_field.dart';
import 'package:web/presentation/screens/drawer_screen.dart';
import 'package:web/presentation/widgets/toast.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return BlocConsumer<TasksCubit, List<TaskModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: _key,
          drawer: const DrawerScreen(),
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              translate('tasks'),
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
                child: DefaultSearchField(
                  controller: searchController,
                  hintText: translate('search'),
                  onTap: () {
                    searchController.text == ''
                        ? showToast(translate('searchValidate'))
                        : {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return const LoadingDialog();
                              },
                            ),
                            TasksCubit.get(context).searchForTask(
                              taskId: searchController.text,
                              afterSuccess: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return const TaskDetailsDialog();
                                  },
                                );
                              },
                            )
                          };
                  },
                  width: 300,
                  height: 10,
                ),
              ),
            ],
            centerTitle: true,
          ),
          body: state.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : TasksCubit.get(context).taskResponse!.tasks!.isEmpty
                  ? Center(
                      child: Image.asset(
                        "assets/images/noOrder.png",
                        height: 150,
                      ),
                    )
                  : CustomScrollView(
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
                                      translate('taskId'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('orderId'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('driver'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('clientName'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('clientPhone'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('itemCount'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('total'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('vendor'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('branch'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('state'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('comment'),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      translate('actions'),
                                    ),
                                  ),
                                ],
                                rows: TasksCubit.get(context)
                                    .taskResponse!
                                    .tasks!
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
                                              data.orderNumber.toString(),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              data.driver,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              data.clientName,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              data.clientPhone,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              data.itemCount.toString(),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              data.price.toString(),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              data.vendor,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              data.branch,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              translate(data.status),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              translate(data.comment),
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
                                                  icon: Icons.location_pin,
                                                  onTap: () {
                                                    _launchMapsUrl(
                                                      data.lat,
                                                      data.lon,
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
    );
  }
}
