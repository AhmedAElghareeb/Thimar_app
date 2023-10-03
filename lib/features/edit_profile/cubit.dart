import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/edit_profile/states.dart';

class EditProfileCubit extends Cubit<EditProfileSates> {
  EditProfileCubit()
      : super(
          EditProfileSates(),
        );

  Future<void> update(
      File? image, String name, String phone, int cityId) async {
    emit(
      EditProfileLoadingState(),
    );

    final response =
        await DioHelper().sendToServer(url: "client/profile", body: {
      "image": image == null
          ? null
          : MultipartFile.fromFileSync(
              image.path,
              filename: image.path.split("/").last,
            ),
      "fullname": name,
      "phone": phone,
      "city_id": cityId,
    });
    if (response.success) {
      emit(
        EditProfileSuccessState(),
      );
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
    } else {
      emit(
        EditProfileFailedState(),
      );
    }
  }
}
