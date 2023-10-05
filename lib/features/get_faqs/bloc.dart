import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/get_faqs/states.dart';

import '../../core/logic/dio_helper.dart';
import '../../models/faqs.dart';
import 'events.dart';

class FaqsBloc extends Bloc<FaqsEvents, GetFaqsStates> {
  FaqsBloc() : super(GetFaqsStates(),){
    on<GetFaqsEvent>(getFaqsData);
  }

  void getFaqsData(GetFaqsEvent event, Emitter<GetFaqsStates> emit) async {
    emit(
      GetFaqsLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "faqs",
    );
    if (response.success) {
      print(response.response!.data);
      final model = FaqsModel.fromJson(response.response!.data);
      emit(
        GetFaqsSuccessState(
          list: model.data,
        ),
      );
    } else {
      emit(
        GetFaqsFailedState(),
      );
    }
  }

}