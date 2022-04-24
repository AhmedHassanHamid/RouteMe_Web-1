import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';
import 'package:web/presentation/widgets/default_search_field.dart';
import 'package:web/presentation/screens/drawer_screen.dart';
import 'package:web/presentation/widgets/toast.dart';

class TasksMapScreen extends StatefulWidget {
  const TasksMapScreen({Key? key}) : super(key: key);

  @override
  State<TasksMapScreen> createState() => _TasksMapScreenState();
}

class _TasksMapScreenState extends State<TasksMapScreen> {
  TextEditingController searchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final Map<String, Marker> _markers = {};
  String myAddress = "";
  double lon = 0, lat = 0;
  GeoCode geoCode = GeoCode();

  static const CameraPosition _initialLocation = CameraPosition(
    target: LatLng(
      30.049960701609457,
      31.23683759550562,
    ),
    zoom: 18,
  );

  Future<void> getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
          zoom: 18,
        ),
      ),
    );
    getAddress(LatLng(position.latitude, position.longitude));
    addMarker(LatLng(position.latitude, position.longitude));
  }

  void addMarker(LatLng position) async {
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: const MarkerId("orderLocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
        position: position,
      );
      _markers["orderLocation"] = marker;
    });
    getAddress(LatLng(position.latitude, position.longitude));
  }

  void getAddress(LatLng position) async {
    Address address = await geoCode.reverseGeocoding(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    lat = position.latitude;
    lon = position.longitude;
    myAddress =
        "${address.streetNumber}, ${address.streetAddress}, ${address.city}, ${address.region}, ${address.countryName}";
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      key: _key,
      drawer: const DrawerScreen(),
      body: Row(
        children: [
          Container(
            width: 300,
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => _key.currentState!.openDrawer(),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 1.h,
                          right:1.w,
                          left: 1.w,
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
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
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultSearchField(
                  controller: searchController,
                  hintText: translate("search"),
                  onTap: () {
                    showToast(translate('searchValidate'));
                  },
                  width: 250,
                  height: 35,
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultAppButton(
                  text: translate("createTask"),
                  backGround: AppColors.darkPurple,
                  fontSize: 20,
                  height: 45,
                  onTap: () {
                    showToast(translate("createTask"));
                  },
                  width: 200,
                  textColor: AppColors.white,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 300,
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  markers: _markers.values.toSet(),
                  onTap: addMarker,
                  initialCameraPosition: _initialLocation,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
