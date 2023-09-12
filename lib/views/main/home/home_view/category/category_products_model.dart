class CategoryProductsModel{
  late int id;
  late final String image, title, body, priceBefore, priceAfter, discount;

  CategoryProductsModel({
    this.id = 0,
    required this.image,
    required this.title,
    required this.body,
    required this.priceBefore,
    required this.priceAfter,
    required this.discount,
  });

  CategoryProductsModel.fromJson(Map<String, dynamic> json){
    image = json["image"];
    title = json["title"];
    body = json["body"];
    priceBefore = json["priceBefore"];
    priceAfter = json["priceAfter"];
    discount = json["discount"];
  }
}


// class CategoryProductsModel {
//   late final List<CategoryProductsModel> data;
//   late final Links links;
//   late final Meta meta;
//   late final String status;
//   late final String message;
//
//   CategoryProductsModel.fromJson(Map<String, dynamic> json){
//     data = List.from(json['data']).map((e)=>CategoryProductsModel.fromJson(e)).toList();
//     links = Links.fromJson(json['links']);
//     meta = Meta.fromJson(json['meta']);
//     status = json['status'];
//     message = json['message'];
//   }
// }
//
// class Data {
//   late final int categoryId;
//   late final int id;
//   late final String title;
//   late final String description;
//   late final String code;
//   late final int priceBeforeDiscount;
//   late final int price;
//   late final double discount;
//   late final int amount;
//   late final int isActive;
//   late final bool isFavorite;
//   late final Unit unit;
//   late final List<Images> images;
//   late final String mainImage;
//   late final String createdAt;
//
//   Data.fromJson(Map<String, dynamic> json){
//     categoryId = json['category_id'];
//     id = json['id'];
//     title = json['title'];
//     description = json['description'];
//     code = json['code'];
//     priceBeforeDiscount = json['price_before_discount'];
//     price = json['price'];
//     discount = json['discount'];
//     amount = json['amount'];
//     isActive = json['is_active'];
//     isFavorite = json['is_favorite'];
//     unit = Unit.fromJson(json['unit']);
//     images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
//     mainImage = json['main_image'];
//     createdAt = json['created_at'];
//   }
// }
//
// class Unit {
//   late final int id;
//   late final String name;
//   late final String type;
//   late final String createdAt;
//   late final String updatedAt;
//
//   Unit.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     type = json['type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
// }
//
// class Images {
//   late final String name;
//   late final String url;
//
//   Images.fromJson(Map<String, dynamic> json){
//     name = json['name'];
//     url = json['url'];
//   }
// }
//
// class Links {
//   late final String first;
//   late final String last;
//   late final Null prev;
//   late final Null next;
//
//   Links.fromJson(Map<String, dynamic> json){
//     first = json['first'];
//     last = json['last'];
//     prev = null;
//     next = null;
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
//     currentPage = json['current_page'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
//     path = json['path'];
//     perPage = json['per_page'];
//     to = json['to'];
//     total = json['total'];
//   }
// }