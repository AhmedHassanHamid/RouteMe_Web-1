import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web/presentation/styles/colors.dart';
import 'package:web/presentation/widgets/default_app_button.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
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
              child: DefaultAppButton(
                width: 250,
                height: 100,
                onTap: (){},
                textColor: AppColors.purple,
                backGround: AppColors.white,
                fontSize: 20,
                text: 'Set Location',
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: showMap
              ? Expanded(
            child: GoogleMap(
              onMapCreated: (controller){
                setState(() {
                  mapController = controller;
                });
              },
              markers: Set<Marker>.of(_markers),
              mapType: MapType.terrain,
              initialCameraPosition: CameraPosition(
                target: LatLng(30.04560570062181, 31.238537082207138),
                zoom: 18,
              ),
            ),
          )
              : CircularProgressIndicator(
            color: AppColors.darkPurple,
          )),
    );
  }
}
