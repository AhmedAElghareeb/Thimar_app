class CartEvents {}

class GetCartDataEvent extends CartEvents {}

class AddToCartDataEvent extends CartEvents {
  final int productId;
  final num amount;

  AddToCartDataEvent({required this.productId, required this.amount});
}

class UpdateCartDataEvent extends CartEvents {
  final int id, amount;

  UpdateCartDataEvent({
    required this.id,
    required this.amount,
  });
}

class AddCouponEvent extends CartEvents {}
