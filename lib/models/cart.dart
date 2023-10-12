class CartData {
  late final List<CartModel> data;
  late final num totalPriceBeforeDiscount;
  late final num totalDiscount;
  late final num totalPriceWithVat;
  late final num deliveryCost;
  late final num freeDeliveryPrice;
  late final num vat;
  late final num isVip;
  late final num vipDiscountPercentage;
  late final num minVipPrice;
  late final String vipMessage;
  late final String status;
  late final String message;

  CartData.fromJson(Map<String, dynamic> json){
    data = List.from(json['data'] ?? []).map((e)=>CartModel.fromJson(e)).toList();
    totalPriceBeforeDiscount = json['total_price_before_discount'] ?? 0;
    totalDiscount = json['total_discount'] ?? 0;
    totalPriceWithVat = json['total_price_with_vat'] ?? 0;
    deliveryCost = json['delivery_cost'] ?? 0;
    freeDeliveryPrice = json['free_delivery_price'] ?? 0;
    vat = json['vat'] ?? 0;
    isVip = json['is_vip'] ?? 0;
    vipDiscountPercentage = json['vip_discount_percentage'] ?? 0;
    minVipPrice = json['min_vip_price'] ?? 0;
    vipMessage = json['vip_message'] ?? "";
    status = json['status'] ?? "";
    message = json['message'] ?? "";
  }
}

class CartModel {
  late final int id;
  late final String title;
  late final String image;
  late   int amount;
  late final num priceBeforeDiscount;
  late final num discount;
  late final num price;
  late final num remainingAmount;

  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    image = json['image'] ?? "";
    amount = json['amount'] ?? 0;
    priceBeforeDiscount = json['price_before_discount'] ?? 0;
    discount = json['discount'] ?? 0;
    price = json['price'] ?? 0;
    remainingAmount = json['remaining_amount'] ?? 0;
  }
}