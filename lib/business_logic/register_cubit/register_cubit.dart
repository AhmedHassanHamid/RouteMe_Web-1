import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/network/responses/successful_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/widgets/toast.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  SuccessfulResponse? successfulResponse;

  Future userRegister({
    required String? name,
    required String? server,
    required String? email,
    required String? password,
    required String? phone,
    required VoidCallback afterSuccess,
    required VoidCallback afterFail,
  }) async {
    emit(RegisterLoadingState());
    await DioHelper.postData(
      url: register,
      body: {
        'name': name,
        'server': server,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      successfulResponse = SuccessfulResponse.fromJson(myData);
      if(successfulResponse!.status == 200){
        showToast(successfulResponse!.message);
        afterSuccess();
      }else{
        afterFail();
      }
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      //showToast(error.toString());
    });
  }
}
