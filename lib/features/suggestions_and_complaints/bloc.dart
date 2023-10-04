import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/suggestions_and_complaints/events.dart';
import 'package:thimar_app/features/suggestions_and_complaints/states.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

class SuggestionsBloc extends Bloc<SuggestionsEvents, SuggestionsStates>{
  SuggestionsBloc() : super(SuggestionsStates(),) {
    on<SendSuggestionEvent>(sendSuggestions);
  }

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();
  final titleController = TextEditingController();

  Future<void> sendSuggestions(SendSuggestionEvent event, Emitter<SuggestionsStates> emit) async {
    emit(
      SuggestionsLoadingState(),
    );

    final response = await DioHelper().sendToServer(
      url: "contact",
      body: {
        "fullname": nameController.text,
        "phone": phoneNumberController.text,
        "title": titleController.text,
        "content": subjectController.text,
      },
    );
    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      nameController.clear();
      phoneNumberController.clear();
      titleController.clear();
      subjectController.clear();
      emit(
        SuggestionsSuccessState(),
      );
    } else {
      emit(
        SuggestionsFailedState(),
      );
    }
  }

}