import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/local/cache_helper.dart';
import 'package:web/data/models/account_model.dart';
import 'package:web/data/network/responses/successful_response.dart';
import 'package:web/data/network/responses/users_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/widgets/toast.dart';

part 'drivers_state.dart';

class DriversCubit extends Cubit<List<AccountModel>> {
  DriversCubit() : super([]);

  static DriversCubit get(context) => BlocProvider.of(context);

  UsersDataResponse? driverResponse;
  SuccessfulResponse? successfulResponse;

  Future getDrivers() async {
    await DioHelper.postData(
      url: getUsers,
      body: {
        'type': "driver",
        'server': CacheHelper.getDataFromSharedPreference(key: "server"),
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      driverResponse = UsersDataResponse.fromJson(myData);
      if (driverResponse!.status == 200) {
        return driverResponse!.user;
      } else {
        return driverResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return driverResponse!.user;
  }

  Future addNewDriver({
    required String name,
    required String email,
    required String password,
    required String phone,
    required VoidCallback afterSuccess,
  }) async {
    await DioHelper.postData(
      url: addDriver,
      body: {
        'server': CacheHelper.getDataFromSharedPreference(key: "server"),
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      successfulResponse = SuccessfulResponse.fromJson(myData);
      if(successfulResponse!.status == 200){
        afterSuccess();
      }
      showToast(successfulResponse!.message);
    }).catchError((error) {
      //showToast(error.toString());
    });
    return successfulResponse!.message;
  }

  void get myDrivers async => emit(await getDrivers());
}
