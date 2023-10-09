import 'dart:io';

class EditProfileEvents {}

class UpdateUserDataEvent extends EditProfileEvents {
  File? image;
  String? name;
  String? phone;
  int? cityId;

  UpdateUserDataEvent(
    this.image,
    this.name,
    this.phone,
    this.cityId,
  );
}

class EditUserPasswordEvent extends EditProfileEvents {
  final String oldPass, pass, confirmPass;

  EditUserPasswordEvent({
    required this.oldPass,
    required this.pass,
    required this.confirmPass,
  });
}
