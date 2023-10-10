
import 'package:flutter/material.dart';

import '../../core/logic/cache_helper.dart';

class AddressesEvents {}

class AddUserAddressEvent extends AddressesEvents {
  String type;

  double lat, long;
  TextEditingController? phoneNumber, discribtion,location;
  int id;

  AddUserAddressEvent({
    required this.type,
    required this.lat,
    required this.long,
    this.id = 0,
  }) {
    phoneNumber = TextEditingController(text: CacheHelper.getPhone());
    discribtion = TextEditingController(text: '');
    location = TextEditingController(text: '');
  }
}

class GetUserAddressEvent extends AddressesEvents {}

class EditUserAddressEvent extends AddressesEvents {
  final String type;
  final int id;

  EditUserAddressEvent({required this.type, required this.id});
}

// class RemoveUserAddressEvent extends AddressesEvents {
//   final String type;
//   final int id;
//
//   RemoveUserAddressEvent({required this.type, required this.id});
// }
