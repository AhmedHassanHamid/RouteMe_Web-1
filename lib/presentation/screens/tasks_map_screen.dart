import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:latlong2/latlong.dart' as latlong;
import 'package:web/business_logic/tasks_cubit/tasks_cubit.dart';
import 'package:web/data/models/task_model.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/screens/drawer_screen.dart';
import 'package:web/presentation/view/create_task_dialog.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/toast.dart';

class TasksMapScreen extends StatefulWidget {
  const TasksMapScreen({Key? key}) : super(key: key);

  @override
  State<TasksMapScreen> createState() => _TasksMapScreenState();
}

class _TasksMapScreenState extends State<TasksMapScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String myAddress = "";
  double lon = 0, lat = 0;

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      key: _key,
      drawer: const DrawerScreen(),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          translate('tasksMap'),
          style: const TextStyle(
            color: AppColors.darkGray,
            fontSize: 20,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
            bottom: 5,
          ),
          child: InkWell(
            onTap: () => _key.currentState!.openDrawer(),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkPurple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.menu,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 5,
              bottom: 5,
            ),
            child: DefaultAppButton(
              text: translate("createTask"),
              backGround: AppColors.darkPurple,
              fontSize: 18,
              height: 10,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const CreateTaskDialog();
                  },
                );
              },
              width: 100,
              textColor: AppColors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: BlocConsumer<TasksCubit, List<TaskModel>>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.isEmpty
              ? FlutterMap(
            options: MapOptions(
              center: latlong.LatLng(30.081742445136637, 31.318578275265946),
              zoom: 12.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                "https://api.mapbox.com/styles/v1/routeme2022/cl33l9s2c004u14ql00qo6t0o/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoicm91dGVtZTIwMjIiLCJhIjoiY2wzM2o1bnc4MDJ2dDNsa2JtaHhpc3IyciJ9.Xo0P7tRS4dIHvLptBUX0pg",
                additionalOptions: {
                  'accessToken':
                  "pk.eyJ1Ijoicm91dGVtZTIwMjIiLCJhIjoiY2wzM2o1bnc4MDJ2dDNsa2JtaHhpc3IyciJ9.Xo0P7tRS4dIHvLptBUX0pg",
                  'id': "mapbox.mapbox-streets-v8"
                },
              ),
            ],
          )
              : FlutterMap(
            options: MapOptions(
              center: latlong.LatLng(
                TasksCubit.get(context).taskResponse!.tasks![0].lat,
                TasksCubit.get(context).taskResponse!.tasks![0].lon,
              ),
              zoom: 12.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                "https://api.mapbox.com/styles/v1/routeme2022/cl33l9s2c004u14ql00qo6t0o/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoicm91dGVtZTIwMjIiLCJhIjoiY2wzM2o1bnc4MDJ2dDNsa2JtaHhpc3IyciJ9.Xo0P7tRS4dIHvLptBUX0pg",
                additionalOptions: {
                  'accessToken':
                  "pk.eyJ1Ijoicm91dGVtZTIwMjIiLCJhIjoiY2wzM2o1bnc4MDJ2dDNsa2JtaHhpc3IyciJ9.Xo0P7tRS4dIHvLptBUX0pg",
                  'id': "mapbox.mapbox-streets-v8"
                },
              ),
              MarkerLayerOptions(
                markers: TasksCubit.get(context).markers,
              ),
            ],
          );
        },
      ),
    );
  }
}