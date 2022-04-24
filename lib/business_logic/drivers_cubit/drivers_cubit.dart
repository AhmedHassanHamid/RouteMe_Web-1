import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/models/account_model.dart';
import 'package:web/data/network/responses/users_response.dart';
import 'package:web/data/remote/dio_helper.dart';

part 'drivers_state.dart';

class DriversCubit extends Cubit<List<AccountModel>> {
  DriversCubit() : super([]);

  static DriversCubit get(context) => BlocProvider.of(context);

  UsersDataResponse? driverResponse;

  Future getDrivers() async {
    await DioHelper.postData(
      url: getUsers,
      body: {
        'type': "driver",
        'server': 'alpha.routeme',//CacheHelper.getDataFromSharedPreference(key: "server"),
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      driverResponse = UsersDataResponse.fromJson(myData);
      print(driverResponse!.status);
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

  void get myDrivers async => emit(await getDrivers());
}
