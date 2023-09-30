import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/features/contact_us/states.dart';
import 'package:thimar_app/models/contact_us.dart';

class ContactUsCubit extends Cubit<ContactUsStates> {
  ContactUsCubit()
      : super(
          ContactUsStates(),
        );

  void getContact() async {
    emit(
      GetContactLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "contact",
    );
    if (response.success) {
      final model = ContactModel.fromJson(response.response!.data);
      emit(
        GetContactSuccessState(model: model),
      );
    } else {
      emit(
        GetContactFailedState(),
      );
    }
  }
}
