import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:web/constants/end_points.dart';
import 'package:web/data/local/cache_helper.dart';
import 'package:web/data/models/task_model.dart';
import 'package:web/data/network/responses/task_response.dart';
import 'package:web/data/remote/dio_helper.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/toast.dart';
import 'package:latlong2/latlong.dart' as latlong;

part 'tasks_state.dart';

class TasksCubit extends Cubit<List<TaskModel>> {
  TasksCubit() : super([]);

  static TasksCubit get(context) => BlocProvider.of(context);

  TaskResponse? taskResponse, searchResponse;
  final List<Marker> markers = [];

  Future getTasks() async {
    await DioHelper.postData(
      url: searchTasks,
      body: {
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
        return taskResponse!.tasks;
      } else {
        return taskResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return taskResponse!.tasks;
  }

  Future searchForTask({
    VoidCallback? afterSuccess,
    String? taskId,
  }) async {
    await DioHelper.postData(
      url: searchTasks,
      body: {
        'dispatcherId': CacheHelper.getDataFromSharedPreference(key: "userId"),
        'taskId': taskId,
      },
    ).then((value) {
      final myData = Map<String, dynamic>.from(value.data);
      searchResponse = TaskResponse.fromJson(myData);
      if (searchResponse!.status == 200) {
        afterSuccess!();
        return searchResponse!.tasks;
      } else {
        showToast(searchResponse!.message);
        return searchResponse!.message;
      }
    }).catchError((error) {
      //showToast(error.toString());
    });
    return searchResponse!.tasks;
  }

  void get myTasks async => emit(await getTasks());
}
