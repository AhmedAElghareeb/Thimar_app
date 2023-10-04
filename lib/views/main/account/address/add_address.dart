import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';

class AddAddress extends StatefulWidget {
  AddAddress({
    super.key,
    this.type = "المنزل",
    this.lat = 0.0,
    this.long = 0.0,
  });

  String? type;
  double lat, long;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final phoneNumber = TextEditingController();
  final discribtion = TextEditingController();

  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(31.0630079, 31.4092708),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "إضافة عنوان",
        ),
        leading: Padding(
          padding: EdgeInsetsDirectional.all(
            10.r,
          ),
          child: GestureDetector(
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: const Color(
                  0xff707070,
                ).withOpacity(0.1),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 7.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16.r,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.h,
              margin: EdgeInsetsDirectional.symmetric(
                horizontal: 8.w,
              ),
              child: MyMap(
                lat: widget.lat,
                lng: widget.long,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: 20.h,
              ),
              child: Container(
                width: 350.w,
                height: 400.h,
                margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  color: const Color(
                    0xffFFFFFF,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 10.h,
                      ),
                      child: Container(
                        width: 342.w,
                        height: 52.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.r),
                          color: const Color(
                            0xffFFFFFF,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0.1.r,
                              color: const Color(
                                0xffeeeeee,
                              ),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 12.w,
                            end: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "نوع العنوان",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(
                                    0xff8B8B8B,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.type = "المنزل";
                                  setState(() {});
                                },
                                child: Container(
                                  height: 36.h,
                                  width: 72.w,
                                  decoration: BoxDecoration(
                                      color: widget.type == "المنزل"
                                          ? Theme.of(context).primaryColor
                                          : null,
                                      borderRadius:
                                          BorderRadius.circular(11.r)),
                                  child: Center(
                                    child: Text(
                                      "المنزل",
                                      style: TextStyle(
                                        color: widget.type == "المنزل"
                                            ? Colors.white
                                            : Theme.of(context).primaryColor,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.type = "العمل";
                                  setState(() {});
                                },
                                child: Container(
                                  height: 36.h,
                                  width: 72.w,
                                  decoration: BoxDecoration(
                                      color: widget.type == "العمل"
                                          ? Theme.of(context).primaryColor
                                          : null,
                                      borderRadius:
                                          BorderRadius.circular(11.r)),
                                  child: Center(
                                    child: Text(
                                      "العمل",
                                      style: TextStyle(
                                        color: widget.type == "العمل"
                                            ? Colors.white
                                            : Theme.of(context).primaryColor,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    AppInput(
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      labelText: "أدخل رقم الجوال",
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    AppInput(
                      controller: discribtion,
                      labelText: "الوصف",
                      minLines: 3,
                    ),
                    SizedBox(
                      height: 49.h,
                    ),
                    AppButton(
                      onTap: () {},
                      text: "إضافة العنوان",
                      width: 342.w,
                      height: 60.h,
                      radius: 15.r,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMap extends StatefulWidget {
  double lat;
  double lng;

  MyMap({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Set<Marker> markers = {};
  final _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        GoogleMap(
          markers: markers,
          onTap: (location) async {
            await goToMyLocation(location: location);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.lat,
              widget.lng,
            ),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        // GestureDetector(
        //   onTap: () async {
        //     _determinePosition();
        //   },
        //   child: Padding(
        //     padding: EdgeInsetsDirectional.symmetric(
        //       horizontal: 16.w,
        //       vertical: 24.h,
        //     ),
        //     child: Container(
        //       padding: EdgeInsetsDirectional.all(8.r),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(
        //           8.r,
        //         ),
        //         color: Theme.of(context).primaryColor.withOpacity(
        //               0.5,
        //             ),
        //       ),
        //       child: Icon(
        //         Icons.location_on_outlined,
        //         color: Colors.white,
        //         size: 30.r,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Future<void> goToMyLocation({required LatLng location}) async {
    widget.lat = location.latitude;
    widget.lng = location.longitude;
    final GoogleMapController controller = await _controller.future;
    markers.add(
      Marker(
        markerId: const MarkerId(
          "1",
        ),
        position: LatLng(
          location.latitude,
          location.longitude,
        ),
      ),
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 14,
          target: location,
        ),
      ),
    );
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission = await Geolocator.requestPermission();

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showSnackBar(
        "Location services are disabled.",
        typ: MessageType.warning,
      );
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var currentLocation = await Geolocator.getCurrentPosition();

    await goToMyLocation(
      location: LatLng(
        currentLocation.latitude,
        currentLocation.longitude,
      ),
    );
    return currentLocation;
  }
}
