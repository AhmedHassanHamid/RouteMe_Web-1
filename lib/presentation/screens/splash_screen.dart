import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/business_logic/app_cubit/app_cubit.dart';
import 'package:web/business_logic/app_cubit/app_state.dart';
import 'package:web/data/local/cache_helper.dart';
import 'package:web/presentation/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit.get(context).navigate(afterSuccess: () {
          CacheHelper.getDataFromSharedPreference(key: 'isLogin') ?? false
              ? Navigator.of(context).pushNamed('/tasksMap')
              : Navigator.of(context).pushNamed('/login');
        });
        return Scaffold(
          body: Container(
            color: AppColors.darkPurple,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.ltr,
                    children: [
                      Image.asset(
                        'assets/images/Mask_Group_6.png',
                      ),
                      Image.asset(
                        'assets/images/Mask_Group_7.png',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Group_10.png',
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.ltr,
                    children: [
                      Image.asset(
                        'assets/images/Mask_Group_4.png',
                      ),
                      Image.asset(
                        'assets/images/Mask_Group_3.png',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
