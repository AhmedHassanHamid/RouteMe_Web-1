import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/network/responses/successful_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/widgets/toast.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  SuccessfulResponse? successfulResponse;

  Future reset({
    required String id,
    required String type,
    required String password,
    required VoidCallback afterSuccess,
    required VoidCallback afterFail,
  }) async {
    await DioHelper.postData(
      url: resetPassword,
      body: {
        'id': id,
        'type': type,
        'password': password,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      successfulResponse = SuccessfulResponse.fromJson(myData);
      if(successfulResponse!.status == 200){
        afterSuccess();
        showToast(successfulResponse!.message);
      }else{
        afterFail();
        showToast(successfulResponse!.message);
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return successfulResponse!.message;
  }
}
