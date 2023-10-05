import 'package:thimar_app/models/slider.dart';

class GetSliderImagesStates {}

class GetSliderImagesLoadingState extends GetSliderImagesStates {}

class GetSliderImagesFailedState extends GetSliderImagesStates {}

class GetSliderImagesSuccessState extends GetSliderImagesStates {
  final List<SliderData> list;

  GetSliderImagesSuccessState({required this.list});
}
