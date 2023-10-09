import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/views/main/account/address/add_address.dart';

import '../../core/logic/dio_helper.dart';
import '../../models/address.dart';
import 'events.dart';
import 'states.dart';

class AddressBloc extends Bloc<AddressesEvents, AddressesStates> {
  AddressBloc() : super(AddressesStates()) {
    on<AddUserAddressEvent>(addAddress);
    on<GetUserAddressEvent>(getAddress);
    on<EditUserAddressEvent>(editAddress);
    on<RemoveUserAddressEvent>(removeAddress);
  }

  Future<void> addAddress(
      AddUserAddressEvent event, Emitter<AddressesStates> emit) async {
    emit(
      AddUserAddressLoadingState(),
    );
String location ='test';
   // final location = await getLocationFromLatLong(LatLng(31.0224366,31.3875197));
    // final location = await getLocationFromLatLong(LatLng(event.lat, event.long));
    print('-==-=- locations is $location');
    final response = await DioHelper().sendToServer(
        url:
            event.id == 0 ? "client/addresses" : "client/addresses/${event.id}",
        body: {
          "type": event.type,
          "phone": event.phoneNumber!.text,
          "description": event.discribtion!.text,
          "location": location,
          "lat": event.lat,
          "lng": event.long,
          "is_default": 1,
          if (event.id != 0) "_method": "PUT"
        });
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      emit(
        AddUserAddressSuccessState(),
      );
    } else {
      emit(
        AddUserAddressFailedState(),
      );
    }
  }

  Future<void> getAddress(
      GetUserAddressEvent event, Emitter<AddressesStates> emit) async {
    emit(
      GetUserAddressLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "client/addresses",
    );
    if (response.success) {
      final list = AddressesData.fromJson(response.response!.data).data;
      if (list.isEmpty) {
        showSnackBar(
          response.msg,
          typ: MessageType.warning,
        );
      }
      emit(
        GetUserAddressSuccessState(
          list: list,
        ),
      );
    } else {
      emit(
        GetUserAddressFailedState(),
      );
    }
  }

  Future<void> editAddress(
      EditUserAddressEvent event, Emitter<AddressesStates> emit) async {
    emit(
      EditUserAddressLoadingState(),
    );

    final response = await DioHelper()
        .putToServer(url: "client/addresses/${event.id}", body: {
      "type": event.type,
    });
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      emit(
        EditUserAddressSuccessState(),
      );
    } else {
      emit(
        EditUserAddressFailedState(),
      );
    }
  }

  Future<void> removeAddress(
      RemoveUserAddressEvent event, Emitter<AddressesStates> emit) async {
    emit(
      RemoveUserAddressLoadingState(),
    );

    final response = await DioHelper()
        .removeFromServer(url: "client/addresses/${event.id}", body: {
      "type": event.type,
    });
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      emit(
        RemoveUserAddressSuccessState(),
      );
    } else {
      emit(
        RemoveUserAddressFailedState(),
      );
    }
  }
}