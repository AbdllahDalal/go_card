// ignore_for_file: avoid_print

import "package:dream_store_app/view/widget/share_compont/custom_appbare.dart";
import "package:fl_location/fl_location.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import 'dart:async';

import "../../../controller/prodect_controller.dart";
import "../../../utilities/constants.dart";
import "../../../utilities/t_keys.g.dart";

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MapSample();
  }
}

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = {};
  LatLng? _selectedLocation;
  late Size size;
  late final ProdectController _prodectController = Get.find();

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndGetLocation();
  }

  Future<void> _checkPermissionsAndGetLocation() async {
    try {
      bool serviceEnabled = await FlLocation.isLocationServicesEnabled;
      if (!serviceEnabled) {
        print('Location services are disabled.');
        return;
      }

      LocationPermission permission =
          await FlLocation.checkLocationPermission();
      if (permission == LocationPermission.denied) {
        permission = await FlLocation.requestLocationPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print('Location permissions are permanently denied.');
        return;
      }

      final locationData = await FlLocation.getLocation();
      _goToCurrentLocation(locationData);
    } catch (e) {
      print('Error in _checkPermissionsAndGetLocation: $e');
    }
  }

  Future<void> _goToCurrentLocation(locationData) async {
    try {
      final GoogleMapController controller = await _controller.future;
      print('Controller obtained: $controller');
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 14.0,
        ),
      ));
    } catch (e) {
      print('Error in _goToCurrentLocation: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    print('Map created: $controller');
  }

  void _onMapTapped(LatLng location) {
    setState(() {
      _selectedLocation = location;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          infoWindow: InfoWindow(
            title: LocaleKeys.selectedLocation.tr,
            snippet: 'Lat: ${location.latitude}, Lng: ${location.longitude}',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        'Google Maps Sample', context,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Constants.kTextColor,
          ),
        ),
        // backgroundColor: Colors.green[700],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(45.521563, -122.677433),
              zoom: 11.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: _markers,
            onTap: _onMapTapped,
          ),
          if (_selectedLocation != null)
            Positioned(
              top: 10,
              left: 0,
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                width: size.width - 20,
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${LocaleKeys.selectedLocation.tr}:\nLat: ${_selectedLocation!.latitude}, Lng: ${_selectedLocation!.longitude}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              _prodectController.selectMaplocation(
                                  "Lat: ${_selectedLocation!.latitude}, Lng: ${_selectedLocation!.longitude}");
                              Get.back();
                            },
                            child: Text(
                              LocaleKeys.sendLocation.tr,
                              style: const TextStyle(
                                  color: Constants.kPrimaryColor),
                            )))
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final locationData = await FlLocation.getLocation();
            print('Location button pressed, locationData: $locationData');
            _goToCurrentLocation(locationData);
          } catch (e) {
            print('Error in FloatingActionButton onPressed: $e');
          }
        },
        tooltip: 'Go to current location',
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
