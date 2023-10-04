import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/features/policy/events.dart';
import 'package:thimar_app/features/policy/states.dart';

import '../../core/logic/dio_helper.dart';

class PolicyBloc extends Bloc<PolicyEvents, PolicyStates> {
  PolicyBloc()
      : super(
          PolicyStates(),
        ) {
    on<GetPolicyEvent>(getPolicyData);
  }

  var data;

  void getPolicyData(GetPolicyEvent event, Emitter<PolicyStates> emit) async {
    emit(
      GetPolicyLoadingState(),
    );
    final response = await DioHelper().getFromServer(
      url: "policy",
    );
    if (response.success) {
      print(response.response!.data);
      data = response.response!.data["data"]["policy"];
      emit(
        GetPolicySuccessState(),
      );
    } else {
      emit(
        GetPolicyFailedState(),
      );
    }
  }
}
