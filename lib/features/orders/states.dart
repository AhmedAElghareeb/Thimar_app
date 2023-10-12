import 'package:thimar_app/core/logic/helper_methods.dart';

import '../../models/orders.dart';

class OrdersStates {}

class GetOrdersDataLoadingState extends OrdersStates {}

class GetOrdersDataSuccessState extends OrdersStates {
  final List<OrdersModel> data;

  GetOrdersDataSuccessState({required this.data});
}

class GetOrdersDataFailedState extends OrdersStates {}

class PostOrdersDataLoadingState extends OrdersStates {}

class PostOrdersDataSuccessState extends OrdersStates {
  final String msg;

  PostOrdersDataSuccessState({required this.msg}) {
    showSnackBar(
      msg,
      typ: MessageType.success,
    );
  }
}

class PostOrdersDataFailedState extends OrdersStates {}
