import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/dio_helper.dart';
import '../../models/cities.dart';
import 'events.dart';
import 'states.dart';

class CitiesBloc extends Bloc<CitiesEvents, GetCitiesStates> {
  CitiesBloc()
      : super(
          GetCitiesStates(),
        ) {
    on<GetCitiesDataEvent>(getData);
  }

  void getData(GetCitiesDataEvent event, Emitter<GetCitiesStates> emit) async {
    emit(
      GetCitiesLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "cities/1",
    );
    if (response.success) {
      final list = List.from(response.response!.data['data'] ?? [])
          .map((e) => CityModel.fromJson(e))
          .toList();
      emit(
        GetCitiesSuccessState(
          list: list,
        ),
      );
    } else {
      emit(
        GetCitiesFailedState(),
      );
    }
  }
}
