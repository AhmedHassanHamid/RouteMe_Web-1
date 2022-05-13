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

part 'dispatchers_state.dart';

class DispatchersCubit extends Cubit<List<AccountModel>> {
  DispatchersCubit() : super([]);

  static DispatchersCubit get(context) => BlocProvider.of(context);

  UsersDataResponse? dispatchersResponse;
  SuccessfulResponse? successfulResponse;

  Future getDispatchers() async {
    await DioHelper.postData(
      url: getUsers,
      body: {
        'type': "dispatcher",
        'server': CacheHelper.getDataFromSharedPreference(key: "server"),
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      dispatchersResponse = UsersDataResponse.fromJson(myData);
      if (dispatchersResponse!.status == 200) {
        return dispatchersResponse!.user;
      } else {
        return dispatchersResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return dispatchersResponse!.user;
  }

  Future addNewDispatcher({
    required String name,
    required String email,
    required String password,
    required String phone,
    required VoidCallback afterSuccess,
  }) async {
    await DioHelper.postData(
      url: addDispatcher,
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

  void get myDispatchers async => emit(await getDispatchers());
}
