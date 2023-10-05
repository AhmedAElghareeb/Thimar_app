import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/dio_helper.dart';
import '../../models/slider.dart';
import 'events.dart';
import 'states.dart';

class SliderBloc extends Bloc<SliderEvents, GetSliderImagesStates> {
  SliderBloc() : super(GetSliderImagesStates(),){
    on<GetSliderDataEvent>(getSliderImages);
  }

  int? currentIndex;

  void getSliderImages(GetSliderDataEvent event, Emitter<GetSliderImagesStates> emit) async {
    emit(
      GetSliderImagesLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "sliders",
    );
    if (response.success) {
      final model = SlidersModel.fromJson(
        response.response!.data,
      );
      emit(
        GetSliderImagesSuccessState(
          list: model.data,
        ),
      );
    } else {
      emit(
        GetSliderImagesFailedState(),
      );
    }
  }
}