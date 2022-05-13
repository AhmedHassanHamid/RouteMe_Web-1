import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/network/responses/verify_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/widgets/toast.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  static VerifyCubit get(context) => BlocProvider.of(context);

  VerifyResponse? verifyResponse;

  Future verifyCode({
    required String email,
    required String code,
    required VoidCallback afterSuccess,
    required VoidCallback afterFail,
  }) async {
    await DioHelper.postData(
      url: verify,
      body: {
        'email': email,
        'code': code,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      verifyResponse = VerifyResponse.fromJson(myData);
      if(verifyResponse!.status == 200) {
        afterSuccess();
        showToast(verifyResponse!.message);
      }else{
        afterFail();
        showToast(verifyResponse!.message);
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return verifyResponse!.message;
  }
}
