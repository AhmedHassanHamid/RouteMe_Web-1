import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/network/responses/successful_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/widgets/toast.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit() : super(DeleteUserInitial());

  static DeleteUserCubit get(context) => BlocProvider.of(context);

  SuccessfulResponse? successfulResponse;

  Future deleteUsers({
    required int id,
    required String type,
  }) async {
    await DioHelper.postData(
      url: deleteUser,
      body: {
        'id': id,
        'type': type,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      successfulResponse = SuccessfulResponse.fromJson(myData);
      showToast(successfulResponse!.message);
    }).catchError((error) {
      showToast(error.toString());
    });
    return successfulResponse!.message;
  }
}
