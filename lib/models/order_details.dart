class OrderDetailsData {
  late final String status;
  late final String message;
  late final OrderDetailsModel data;

  OrderDetailsData.fromJson(Map<String, dynamic> json){
    status = json['status'] ?? "";
    message = json['message'] ?? "";
    data = OrderDetailsModel.fromJson(json['data']);
  }
}

class OrderDetailsModel {
  late final num id;
  late final String status;
  late final String date;
  late final String time;
  late final num orderPrice;
  late final num deliveryPrice;
  late final num totalPrice;
  late final String clientName;
  late final String phone;
  late final Address address;
  late final List<Products> products;
  late final String payType;
  late final Null note;
  late final String deliveryPayer;
  late final num isVip;
  late final num vipDiscount;
  late final num priceBeforeDiscount;
  late final num discount;

  OrderDetailsModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    status = json['status'] ?? "";
    date = json['date'] ?? "";
    time = json['time'] ?? "";
    orderPrice = json['order_price'] ?? 0;
    deliveryPrice = json['delivery_price'] ?? 0;
    totalPrice = json['total_price'] ?? 0;
    clientName = json['client_name'] ?? "";
    phone = json['phone'] ?? "";
    address = Address.fromJson(json['address']);
    products = List.from(json['products'] ?? []).map((e)=>Products.fromJson(e)).toList();
    payType = json['pay_type'] ?? "";
    note = null;
    deliveryPayer = json['delivery_payer'] ?? "";
    isVip = json['is_vip'] ?? 0;
    vipDiscount = json['vip_discount'] ?? 0;
    priceBeforeDiscount = json['price_before_discount'] ?? 0;
    discount = json['discount'] ?? 0;
  }
}

class Address {
  late final num id;
  late final String type;
  late final num lat;
  late final num lng;
  late final String location;
  late final String description;
  late final bool isDefault;
  late final String phone;

  Address.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    type = json['type'] ?? "";
    lat = json['lat'] ?? 0;
    lng = json['lng'] ?? 0;
    location = json['location'] ?? "";
    description = json['description'] ?? "";
    isDefault = json['is_default'] ?? false;
    phone = json['phone'] ?? "";
  }
}

class Products {
  late final String name;
  late final String url;

  Products.fromJson(Map<String, dynamic> json){
    name = json['name'] ?? "";
    url = json['url'] ?? "";
  }
}