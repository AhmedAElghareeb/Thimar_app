import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import 'events.dart';
import 'states.dart';

class AboutUsBloc extends Bloc<AboutUsEvents, GetAboutUsStates>
{
  AboutUsBloc() : super(GetAboutUsStates(),){
    on<GetAboutUsEvent>(getAboutData);
  }

  var data;
  void getAboutData(GetAboutUsEvent event, Emitter<GetAboutUsStates> emit) async {
    emit(
      GetAboutUsLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "about",
    );
    if (response.success) {
      print(response.response!.data);
      data = response.response!.data["data"]["about"];
      emit(
        GetAboutUsSuccessState(),
      );
    } else {
      emit(
        GetAboutUsFailedState(),
      );
    }
  }

}