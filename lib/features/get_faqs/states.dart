import '../../models/faqs.dart';

class GetFaqsStates {}

class GetFaqsLoadingState extends GetFaqsStates {}

class GetFaqsSuccessState extends GetFaqsStates {
  final List<FaqsData> list;

  GetFaqsSuccessState({required this.list});
}

class GetFaqsFailedState extends GetFaqsStates {}
