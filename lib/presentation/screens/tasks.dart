import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_search_field.dart';

//import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  late GoogleMapController mapController;
  List<Marker> _markers = [];
  bool showMap = true;
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _markers.add(Marker(
      markerId: MarkerId('myLocation'),
      position: LatLng(30.04560570062181, 31.238537082207138),
    ));
    if (_markers.isNotEmpty) {
      setState(() {
        showMap = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.darkPurple,
          title: const Text('Reebok'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20, bottom: 5),
              child: DefaultSearchField(
                controller: search,
                hintText: 'Search',
                onTap: () {},
                width: 400,
                height: 10,
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width - 300,
              child: showMap
                  ? Expanded(
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          setState(() {
                            mapController = controller;
                          });
                        },
                        markers: Set<Marker>.of(_markers),
                        mapType: MapType.terrain,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(30.04560570062181, 31.238537082207138),
                          zoom: 18,
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(
                      color: AppColors.darkPurple,
                    )),
          Container(
            height: MediaQuery.of(context).size.height,
            width: 300,
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,right: 5,left: 5,bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultAppButton(
                      width: 160,
                      height: 40,
                      onTap: (){},
                      textColor: AppColors.white,
                      backGround: AppColors.darkPurple,
                      fontSize: 20,
                      text: 'Create Task',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 260,
                      height: 800,
                      child: ListView.builder(
                        itemCount: 25,
                          itemBuilder: (BuildContext context,int index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DefaultAppButton(
                                width: 160,
                                height: 40,
                                onTap: (){},
                                textColor: AppColors.white,
                                backGround: AppColors.darkPurple,
                                fontSize: 20,
                                text: 'Create Task',
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
