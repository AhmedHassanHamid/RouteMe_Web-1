import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:sizer/sizer.dart';
import 'package:web/business_logic/orders_cubit/orders_cubit.dart';
import 'package:web/data/models/order_model.dart';
import 'package:web/presentation/styles/colors.dart';

class OrderDetailsDialog extends StatelessWidget {
  const OrderDetailsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, List<OrderModel>>(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  translate('orderDetails'),
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
                                      .state,
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
                                  OrderCubit.get(context)
                                      .searchResponse!
                                      .orders![0]
                                      .comment,
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
