class OrdersData {
  late final List<OrdersModel> data;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;

  OrdersData.fromJson(Map<String, dynamic> json){
    data = List.from(json['data'] ?? []).map((e)=>OrdersModel.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'] ?? "";
    message = json['message'] ?? "";
  }
}

class OrdersModel {
  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final num? orderPrice;
  late final num deliveryPrice;
  late final num totalPrice;
  late final String clientName;
  late final String phone;
  late final String location;
  late final String deliveryPayer;
  late final List<ImageModel> products;
  late final String payType;
  late final String? note;
  late final num isVip;
  late final num vipDiscountPercentage;

  OrdersModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    status = json['status'] ?? "";
    date = json['date'] ?? "";
    time = json['time'] ?? "";
    orderPrice = json['order_price'] ?? 0;
    deliveryPrice = json['delivery_price'] ?? 0;
    totalPrice = json['total_price'] ?? 0;
    clientName = json['client_name'] ?? "";
    phone = json['phone'] ?? "";
    location = json['location'] ?? "";
    deliveryPayer = json['delivery_payer'] ?? "";
    products = List.from(json['products'] ?? []).map((e)=>ImageModel.fromJson(e)).toList();
    payType = json['pay_type'] ?? "";
    note = null;
    isVip = json['is_vip'] ?? 0;
    vipDiscountPercentage = json['vip_discount_percentage'] ?? 0;
  }
}

class ImageModel {
  late final String name;
  late final String url;

  ImageModel.fromJson(Map<String, dynamic> json){
    name = json['name'] ?? "";
    url = json['url'] ?? "";
  }
}

class Links {
  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;

  Links.fromJson(Map<String, dynamic> json){
    first = json['first'] ?? "";
    last = json['last'] ?? "";
    prev = null;
    next = null;
  }
}

class Meta {
  late final num currentPage;
  late final num from;
  late final num lastPage;
  late final List<Links> links;
  late final String path;
  late final num perPage;
  late final num to;
  late final num total;

  Meta.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'] ?? 0;
    from = json['from'] ?? 0;
    lastPage = json['last_page'] ?? 0;
    links = List.from(json['links'] ?? []).map((e)=>Links.fromJson(e)).toList();
    path = json['path'] ?? "";
    perPage = json['per_page'] ?? 0;
    to = json['to'] ?? 0;
    total = json['total'] ?? 0;
  }
}