class CartEvents {}

class GetCartDataEvent extends CartEvents {}

class AddToCartDataEvent extends CartEvents {
  final int productId, amount;

  AddToCartDataEvent({required this.productId, required this.amount});
}

// class RemoveFromCartDataEvent extends CartEvents {
//   final int id;
//
//   RemoveFromCartDataEvent({required this.id});
// }