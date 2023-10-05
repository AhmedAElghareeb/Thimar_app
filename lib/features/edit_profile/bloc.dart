
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import 'events.dart';
import 'states.dart';

class EditProfileBloc extends Bloc<EditProfileEvents, EditProfileSates> {
  EditProfileBloc()
      : super(
          EditProfileSates(),
        ) {
    on<UpdateUserDataEvent>(update);
  }

  void update(UpdateUserDataEvent event, Emitter<EditProfileSates> emit) async {
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
}
