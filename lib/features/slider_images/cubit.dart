import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/features/slider_images/states.dart';
import 'package:thimar_app/models/slider_model.dart';

class GetSliderImagesCubit extends Cubit<GetSliderImagesStates> {
  GetSliderImagesCubit() : super(GetSliderImagesStates());


  int? currentIndex;

  void getSliderImages() async {
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
