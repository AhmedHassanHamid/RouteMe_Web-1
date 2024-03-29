import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/local/cache_helper.dart';
import 'package:web/data/models/task_model.dart';
import 'package:web/data/network/responses/order_response.dart';
import 'package:web/data/network/responses/successful_response.dart';
import 'package:web/data/network/responses/task_response.dart';
import 'package:web/data/network/responses/users_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/toast.dart';
import 'package:latlong2/latlong.dart' as latlong;

part 'tasks_state.dart';

class TasksCubit extends Cubit<List<TaskModel>> {
  TasksCubit() : super([]);

  static TasksCubit get(context) => BlocProvider.of(context);

  TaskResponse? taskResponse, searchResponse;
  OrderResponse? orderResponse;
  UsersDataResponse? driverResponse;
  SuccessfulResponse? successfulResponse;
  final List<Marker> markers = [];
  List<int> orderNumbers = [];
  List<String> driversName = [];
  List<TaskModel> ifNull = [];

  Future getTasks() async {
    await DioHelper.postData(
      url: searchTasks,
      body: {
        'server': CacheHelper.getDataFromSharedPreference(key: "server"),
        'dispatcherId': CacheHelper.getDataFromSharedPreference(key: "userId"),
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      taskResponse = TaskResponse.fromJson(myData);
      if (taskResponse!.status == 200) {
        for (var points in taskResponse!.tasks!) {
          markers.add(
            Marker(
              point: latlong.LatLng(
                points.lat,
                points.lon,
              ),
              builder: (ctx) => const Icon(
                Icons.location_on,
                color: AppColors.darkPurple,
                size: 35,
              ),
            ),
          );
        }
        return taskResponse!.tasks ?? ifNull;
      } else {
        return taskResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return taskResponse!.tasks ?? ifNull;
  }

  Future searchForTask({
    VoidCallback? afterSuccess,
    String? taskId,
  }) async {
    await DioHelper.postData(
      url: searchTasks,
      body: {
        'server': CacheHelper.getDataFromSharedPreference(key: "server"),
        'dispatcherId': CacheHelper.getDataFromSharedPreference(key: "userId"),
        'taskId': taskId,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      searchResponse = TaskResponse.fromJson(myData);
      if (searchResponse!.status == 200) {
        afterSuccess!();
        return searchResponse!.tasks ?? ifNull;
      } else {
        showToast(searchResponse!.message);
        return searchResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return searchResponse!.tasks ?? ifNull;
  }

  Future createNewTask({
    required String orderNumber,
    required String driverId,
    required String driver,
    required String clientName,
    required String clientPhone,
    required String itemCount,
    required String price,
    required String vendorId,
    required String vendor,
    required String branch,
    required String lon,
    required String lat,
    required String address,
    required String start,
    required String end,
    required String comment,
    required String status,
    required VoidCallback afterSuccess,
  })
  async {
    await DioHelper.postData(
      url: createTask,
      body: {
        'server': CacheHelper.getDataFromSharedPreference(key: "server"),
        'dispatcherId': CacheHelper.getDataFromSharedPreference(key: "userId"),
        'orderNumber': orderNumber,
        'driverId': driverId,
        'driver': driver,
        'clientName': clientName,
        'clientPhone': clientPhone,
        'itemCount': itemCount,
        'price': price,
        'vendorId': vendorId,
        'vendor': vendor,
        'branch': branch,
        'lon': lon,
        'lat': lat,
        'address': address,
        'start': start,
        'end': end,
        'comment': comment,
        'status': status,
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


  Future getTaskOrders() async {
    await DioHelper.postData(
      url: taskOrders,
      body: {
        'server': CacheHelper.getDataFromSharedPreference(key: "server"),
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      orderResponse = OrderResponse.fromJson(myData);
      if (orderResponse!.status == 200) {
        for (int y = 0; y <= orderResponse!.orders!.length; y++) {
          orderNumbers.add(orderResponse!.orders![y].id);
        }
        return orderResponse!.orders;
      } else {
        return orderResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return orderResponse!.orders;
  }


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
        for (int y = 0; y <= orderResponse!.orders!.length; y++) {
          driversName.add(driverResponse!.user![y].name);
        }
        return driverResponse!.user ?? ifNull;
      } else {
        return driverResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return driverResponse!.user ?? ifNull;
  }

  void get myTasks async => emit(await getTasks());
  void get myOrdersNumber async => emit(await getTaskOrders());
  void get myDrivers async => emit(await getDrivers());
}