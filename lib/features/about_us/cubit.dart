import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/about_us/states.dart';

import '../../core/logic/dio_helper.dart';

class GetAboutUsCubit extends Cubit<GetAboutUsStates>{
  GetAboutUsCubit() : super(GetAboutUsStates(),);

  var data;
  void getAboutData() async {
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