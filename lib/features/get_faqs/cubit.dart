import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';
import 'package:thimar_app/features/get_faqs/states.dart';

import '../../models/faqs_model.dart';

class GetFaqsCubit extends Cubit<GetFaqsStates> {
  GetFaqsCubit()
      : super(
          GetFaqsStates(),
        );

  void getFaqsData() async {
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
