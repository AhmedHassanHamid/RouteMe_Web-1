import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/network/responses/successful_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/widgets/toast.dart';

part 'edit_user_state.dart';

class EditUserCubit extends Cubit<EditUserState> {
  EditUserCubit() : super(EditUserInitial());

  static EditUserCubit get(context) => BlocProvider.of(context);

  SuccessfulResponse? successfulResponse;

  Future updateEmployee({
    required int id,
    required String type,
    required String name,
    required String email,
    required String phone,
  }) async {
    await DioHelper.postData(
      url: updateUser,
      body: {
        'id': id,
        'type': type,
        'name': name,
        'email': email,
        'phone': phone,
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

  Future updateVendor({
    required int id,
    required String name,
    required String email,
    required String phone,
  }) async {
    await DioHelper.postData(
      url: updateUser,
      body: {
        'id': id,
        'type': 'vendor',
        'brandName': name,
        'email': email,
        'phone': phone,
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
