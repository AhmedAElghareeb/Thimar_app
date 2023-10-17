class ProductsRatesData {
  late final List<ProductsRatesModel> list;
  // late final Links links;
  // late final Meta meta;
  late final String status;
  late final String message;

  ProductsRatesData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data'] ?? []).map((e)=>ProductsRatesModel.fromJson(e)).toList();
    // links = Links.fromJson(json['links']);
    // meta = Meta.fromJson(json['meta']);
    status = json['status'] ?? "";
    message = json['message'] ?? "";
  }
}

class ProductsRatesModel {
  late final double value;
  late final String comment;
  late final String clientName;
  late final String clientImage;

  ProductsRatesModel.fromJson(Map<String, dynamic> json){
    value = double.parse(json['value'].toString());
    comment = json['comment'] ?? "";
    clientName = json['client_name'] ?? "";
    clientImage = json['client_image'] ?? "";
  }
}

// class Links {
//   late final String first;
//   late final String last;
//   late final Null prev;
//   late final String next;
//
//   Links.fromJson(Map<String, dynamic> json){
//     first = json['first'] ?? "";
//     last = json['last'] ?? "";
//     prev = null;
//     next = json['next'] ?? "";
//   }
// }
//
// class Meta {
//   late final int currentPage;
//   late final int from;
//   late final int lastPage;
//   late final List<Links> links;
//   late final String path;
//   late final int perPage;
//   late final int to;
//   late final int total;
//
//   Meta.fromJson(Map<String, dynamic> json){
//     currentPage = json['current_page'] ?? 0;
//     from = json['from'] ?? 0;
//     lastPage = json['last_page'] ?? 0;
//     links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
//     path = json['path'] ?? "";
//     perPage = json['per_page'] ?? 0;
//     to = json['to'] ?? 0;
//     total = json['total'] ?? 0;
//   }
// }