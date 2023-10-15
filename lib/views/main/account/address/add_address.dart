import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/address/states.dart';

import '../../../../features/address/bloc.dart';
import '../../../../features/address/events.dart';
import '../../../../models/address.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({
    super.key,
    this.model,
    this.isEditing = true,
  });

  final AddressModel? model;
  final bool isEditing;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();

  final addAddressBloc = KiwiContainer().resolve<AddressBloc>();
  final _event = AddUserAddressEvent(
    type: 'المنزل',
    lat: 0,
    long: 0,
  );

  @override
  void initState() {
    super.initState();
    if (widget.model != null) {
      _event.discribtion!.text = widget.model!.description;
      _event.phoneNumber!.text = widget.model!.phone;
      _event.location!.text = widget.model!.location;
      _event.type = widget.model!.type;
      _event.lat = widget.model!.lat;
      _event.long = widget.model!.lng;
      _event.id = widget.model!.id;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.isEditing ? "إضافة عنوان" : "تعديل العنوان",
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 8.w,
                ),
                child: MyMap(
                  onSuccess: (latLong, desc) {
                    print('-==--== from view latlong is ${latLong.toJson()}');
                    _event.lat = latLong.latitude;
                    _event.long = latLong.longitude;
                    _event.location!.text = desc!;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 20.h,
                ),
                child: Container(
                  width: 350.w,
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
                  child: Form(
                    key: _formKey,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      _event.type = "المنزل";
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 36.h,
                                      width: 72.w,
                                      decoration: BoxDecoration(
                                          color: _event.type == "المنزل"
                                              ? Theme.of(context).primaryColor
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(11.r)),
                                      child: Center(
                                        child: Text(
                                          "المنزل",
                                          style: TextStyle(
                                            color: _event.type == "المنزل"
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
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
                                      _event.type = "العمل";
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 36.h,
                                      width: 72.w,
                                      decoration: BoxDecoration(
                                          color: _event.type == "العمل"
                                              ? Theme.of(context).primaryColor
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(11.r)),
                                      child: Center(
                                        child: Text(
                                          "العمل",
                                          style: TextStyle(
                                            color: _event.type == "العمل"
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .primaryColor,
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
                          controller: _event.phoneNumber,
                          keyboardType: TextInputType.phone,
                          labelText: "أدخل رقم الجوال",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "هذا الحقل مطلوب";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        AppInput(
                          controller: _event.location,
                          labelText: "العنوان",
                          minLines: 4,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "هذا الحقل مطلوب";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        AppInput(
                          controller: _event.discribtion,
                          labelText: "الوصف",
                          minLines: 2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "هذا الحقل مطلوب";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BlocConsumer(
                          bloc: addAddressBloc,
                          listener: (context, state) {
                            if (state is AddUserAddressSuccessState) {
                              Navigator.of(context).pop();
                            }
                          },
                          builder: (context, state) {
                            return AppButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  addAddressBloc.add(
                                    _event,
                                  );
                                }
                              },
                              text: widget.isEditing
                                  ? "إضافة العنوان"
                                  : "تعديل العنوان",
                              isLoading: state is AddUserAddressLoadingState,
                              width: 342.w,
                              height: 60.h,
                              radius: 15.r,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyMap extends StatefulWidget {
  final Function(LatLng, String?) onSuccess;

  const MyMap({
    Key? key,
    required this.onSuccess,
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
        currentLocation == null
            ? SizedBox(
                height: 200.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : GoogleMap(
                markers: markers,
                onTap: (location) async {
                  await goToMyLocation(
                    location: location,
                  );
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentLocation!.latitude,
                    currentLocation!.longitude,
                  ),
                  zoom: 14,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
      ],
    );
  }

  Future<void> goToMyLocation({required LatLng location}) async {
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

  _determinePosition() async {
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
    currentLocation = await Geolocator.getCurrentPosition();

    setState(() {});
    if (currentLocation != null) {
      await goToMyLocation(
        location: LatLng(
          currentLocation!.latitude,
          currentLocation!.longitude,
        ),
      );
      String locationDesc = await getLocationFromLatLong(
          LatLng(currentLocation!.latitude, currentLocation!.longitude));
      widget.onSuccess(
          LatLng(
            currentLocation!.latitude,
            currentLocation!.longitude,
          ),
          locationDesc);
    }
  }

  Position? currentLocation;
}
