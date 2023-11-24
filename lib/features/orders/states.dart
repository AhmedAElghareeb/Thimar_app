import 'package:thimar_app/core/logic/helper_methods.dart';

import '../../models/order_details.dart';
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

class PostOrdersDataFailedState extends OrdersStates {
  final String msg;

  PostOrdersDataFailedState({required this.msg}) {
    showSnackBar(
      msg,
    );
  }
}

class GetOrderDetailsDataLoadingState extends OrdersStates {}

class GetOrderDetailsDataSuccessState extends OrdersStates {
  final OrderDetailsModel data;

  GetOrderDetailsDataSuccessState({required this.data});
}

class GetOrderDetailsDataFailedState extends OrdersStates {}

class CancelOrdersDataLoadingState extends OrdersStates {}

class CancelOrdersDataSuccessState extends OrdersStates {
  final String msg;

  CancelOrdersDataSuccessState({required this.msg}) {
    showSnackBar(
      msg,
      typ: MessageType.success,
    );
  }
}

class CancelOrdersDataFailedState extends OrdersStates {}
