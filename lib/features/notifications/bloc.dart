import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/helper_methods.dart';
import 'package:thimar_app/models/notifications.dart';

import '../../core/logic/dio_helper.dart';
import 'events.dart';
import 'states.dart';

class NotificationsBloc extends Bloc<NotificationsEvents, NotificationsStates> {
  NotificationsBloc() : super(NotificationsStates()) {
    on<GetNotificationsEvent>(getNotify);
  }

  Future<void> getNotify(
      GetNotificationsEvent event, Emitter<NotificationsStates> emit) async {
    emit(
      GetNotificationsLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "notifications",
    );

    if (response.success) {
      final list =
          NotificationData.fromJson(response.response!.data).list.notifications;
      emit(
        GetNotificationsSuccessState(
          list: list,
        ),
      );
    } else {
      emit(
        GetNotificationsFailedState(),
      );
    }
  }
}
