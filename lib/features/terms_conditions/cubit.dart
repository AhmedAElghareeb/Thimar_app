import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/terms_conditions/states.dart';

import '../../core/logic/dio_helper.dart';

class GetTermsCubit extends Cubit<GetTermsStates> {
  GetTermsCubit()
      : super(
          GetTermsStates(),
        );

  var data;

  void getTermsData() async {
    emit(
      GetTermsLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "terms",
    );
    if (response.success) {
      print(response.response!.data);
      data = response.response!.data["data"]["terms"];
      emit(
        GetTermsSuccessState(),
      );
    } else {
      emit(
        GetTermsFailedState(),
      );
    }
  }
}
