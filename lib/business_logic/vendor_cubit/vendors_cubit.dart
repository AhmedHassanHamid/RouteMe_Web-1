import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/local/cache_helper.dart';
import 'package:web/data/models/vendor_model.dart';
import 'package:web/data/network/responses/successful_response.dart';
import 'package:web/data/network/responses/vendors_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/widgets/toast.dart';

part 'vendors_state.dart';

class VendorsCubit extends Cubit<List<VendorModel>> {
  VendorsCubit() : super([]);

  static VendorsCubit get(context) => BlocProvider.of(context);

  VendorsResponse? vendorResponse;
  SuccessfulResponse? successfulResponse;

  Future getVendors() async {
    await DioHelper.postData(
      url: getUsers,
      body: {
        'type': "vendor",
        'server': 'alpha.routeme',//CacheHelper.getDataFromSharedPreference(key: "server"),
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      vendorResponse = VendorsResponse.fromJson(myData);
      if (vendorResponse!.status == 200) {
        return vendorResponse!.user;
      } else {
        return vendorResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return vendorResponse!.user;
  }


  Future addNewVendor({
    required String brandName,
    required String email,
    required String password,
    required VoidCallback afterSuccess,
  }) async {
    await DioHelper.postData(
      url: addVendor,
      body: {
        'server': CacheHelper.getDataFromSharedPreference(key: "server"),
        'brandName': brandName,
        'email': email,
        'password': password,
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

  void get myVendors async => emit(await getVendors());
}
