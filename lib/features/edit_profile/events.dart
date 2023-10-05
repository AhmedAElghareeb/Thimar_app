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
