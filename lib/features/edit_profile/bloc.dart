import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/cache_helper.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../models/login.dart';
import 'events.dart';
import 'states.dart';


class EditProfileBloc extends Bloc<EditProfileEvents, EditProfileStates> {
  EditProfileBloc()
      : super(
          EditProfileStates(),
        ) {
    on<UpdateUserDataEvent>(update);
    on<EditUserPasswordEvent>(editPassword);
  }

  void update(UpdateUserDataEvent event, Emitter<EditProfileStates> emit) async {
    emit(
      EditProfileLoadingState(),
    );

    final response =
        await DioHelper().sendToServer(url: "client/profile", body: {
      "image": event.image == null
          ? null
          : MultipartFile.fromFileSync(
              event.image!.path,
              filename: event.image!.path.split("/").last,
            ),
      "fullname": event.name,
      "phone": event.phone,
      "city_id": event.cityId,
    });
    if (response.success) {
      await CacheHelper.saveLoginData(
          UserModel.fromJson(response.response!.data['data']));
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
      showSnackBar(response.msg);
    }
  }

  void editPassword(EditUserPasswordEvent event, Emitter<EditProfileStates> emit) async {
    emit(
      EditUserPasswordLoadingState(),
    );

    final response =
    await DioHelper().putToServer(url: "edit_password", body: {
      "old_password" : event.oldPass,
      "password" : event.pass,
      "password_confirmation" : event.confirmPass,
    });
    if (response.success) {
      emit(
        EditUserPasswordSuccessState(),
      );
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
    } else {
      emit(
        EditProfileFailedState(),
      );
      showSnackBar(response.msg);
    }
  }
}
