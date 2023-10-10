import '../../models/address.dart';

class AddressesStates {}

class AddUserAddressLoadingState extends AddressesStates {}

class AddUserAddressSuccessState extends AddressesStates {}

class AddUserAddressFailedState extends AddressesStates {}

class GetUserAddressLoadingState extends AddressesStates {}

class GetUserAddressSuccessState extends AddressesStates {
  final List<AddressModel> list;

  GetUserAddressSuccessState({required this.list});
}

class GetUserAddressFailedState extends AddressesStates {}

class EditUserAddressLoadingState extends AddressesStates {}

class EditUserAddressSuccessState extends AddressesStates {}

class EditUserAddressFailedState extends AddressesStates {}

// class RemoveUserAddressLoadingState extends AddressesStates {}
//
// class RemoveUserAddressSuccessState extends AddressesStates {}
//
// class RemoveUserAddressFailedState extends AddressesStates {}