import '../../models/notifications.dart';

class NotificationsStates {}

class GetNotificationsLoadingState extends NotificationsStates {}

class GetNotificationsSuccessState extends NotificationsStates {

  final List<Notifications> list;

  GetNotificationsSuccessState({required this.list});

}

class GetNotificationsFailedState extends NotificationsStates {}
