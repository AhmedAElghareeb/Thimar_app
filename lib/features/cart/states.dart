import 'package:thimar_app/core/logic/helper_methods.dart';

import '../../models/cart.dart';

class CartStates {}

class GetCartDataLoadingState extends CartStates {}

class GetCartDataSuccessState extends CartStates {
  final List<CartModel> list;

  GetCartDataSuccessState({required this.list});
}

class GetCartDataFailedState extends CartStates {}

class AddToCartDataLoadingState extends CartStates {}

class AddToCartDataSuccessState extends CartStates {
  final String msg;

  AddToCartDataSuccessState({required this.msg}) {
    showSnackBar(
      msg,
      typ: MessageType.success,
    );
  }
}

class AddToCartDataFailedState extends CartStates {
  final String msg;

  AddToCartDataFailedState({required this.msg}) {
    showSnackBar(
      msg,
    );
  }
}

// class RemoveFromCartDataLoadingState extends CartStates {}
//
// class RemoveFromCartDataSuccessState extends CartStates {
//   final String msg;
//
//   RemoveFromCartDataSuccessState({required this.msg}) {
//     showSnackBar(
//       msg,
//       typ: MessageType.success,
//     );
//   }
// }
//
// class RemoveFromCartDataFailedState extends CartStates {
//   final String msg;
//
//   RemoveFromCartDataFailedState({required this.msg}) {
//     showSnackBar(
//       msg,
//     );
//   }
// }
