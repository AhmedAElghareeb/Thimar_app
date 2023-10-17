import 'package:thimar_app/core/logic/helper_methods.dart';

import '../../models/cart.dart';

class CartStates {}

class GetCartDataLoadingState extends CartStates {}

class GetCartDataSuccessState extends CartStates {
  final List<CartModel> list;
  final String taxMsg;
  final num priceBefore, discount, priceWithVat, deliveryCost, vat;

  GetCartDataSuccessState({
    required this.priceBefore,
    required this.discount,
    required this.priceWithVat,
    required this.deliveryCost,
    required this.vat,
    required this.list,
    required this.taxMsg,
  });
}

class GetCartDataFailedState extends CartStates {}

class AddToCartDataLoadingState extends CartStates {
  final int id;

  AddToCartDataLoadingState(this.id);
}

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

class UpdateCartDataStateLoading extends CartStates {}

class UpdateCartDataStateSuccess extends CartStates {
  final String msg;

  UpdateCartDataStateSuccess({required this.msg}) {
    showSnackBar(
      msg,
      typ: MessageType.success,
    );
  }
}

class UpdateCartDataStateFailed extends CartStates {}

class AddCouponLoadingState extends CartStates {}

class AddCouponSuccessState extends CartStates {
  final String msg;

  AddCouponSuccessState({required this.msg}) {
    showSnackBar(
      msg,
      typ: MessageType.success,
    );
  }
}

class AddCouponFailedState extends CartStates {}
