import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/tasks_cubit/tasks_cubit.dart';
import 'package:web/data/models/task_model.dart';
import 'package:web/presentation/styles/colors.dart';

class TaskDetailsDialog extends StatelessWidget {
  const TaskDetailsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                  onTap: () => Navigator.pushNamed(context, "/tasks"),
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.gray,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  translate('taskDetails'),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("taskNo"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .id
                                      .toString(),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("orderNo"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .orderNumber
                                      .toString(),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("driverName"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .driver,
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("client"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .clientName,
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("phone"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .clientPhone,
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("items"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .itemCount
                                      .toString(),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("price"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .price
                                      .toString(),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("vendorD"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .vendor,
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("branchD"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  TasksCubit.get(context)
                                      .searchResponse!
                                      .tasks![0]
                                      .branch,
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("stateD"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  translate(
                                    TasksCubit.get(context)
                                        .searchResponse!
                                        .tasks![0]
                                        .status,
                                  ),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  translate("commentD"),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  translate(
                                    TasksCubit.get(context)
                                        .searchResponse!
                                        .tasks![0]
                                        .comment,
                                  ),
                                  style: const TextStyle(
                                    color: AppColors.darkGray,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
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
