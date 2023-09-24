import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/features/get_cities/states.dart';
import 'package:thimar_app/models/cities.dart';

class GetCitiesCubit extends Cubit<GetCitiesStates> {
  GetCitiesCubit() : super(GetCitiesStates());

  void getData() async {
    emit(
      GetCitiesLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "cities/1",
    );
    if (response.success) {
      final model = GetCitiesData.fromJson(response.response!.data);
      emit(
        GetCitiesSuccessState(list: model.list),
      );
    } else {
      emit(
        GetCitiesFailedState(),
      );
    }
  }
}
