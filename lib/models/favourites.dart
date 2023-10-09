// class FavouritesModel{
//   late int id;
//   late final String image, title, body, priceBefore, priceAfter, discount;
//
//   FavouritesModel({
//     this.id = 0,
//     required this.image,
//     required this.title,
//     required this.body,
//     required this.priceBefore,
//     required this.priceAfter,
//     required this.discount,
//   });
//
//   FavouritesModel.fromJson(Map<String, dynamic> json){
//     image = json["image"];
//     title = json["title"];
//     body = json["body"];
//     priceBefore = json["priceBefore"];
//     priceAfter = json["priceAfter"];
//     discount = json["discount"];
//   }
// }

class FavouritesData {
  late final List<FavouritesModel> list;
  late final String status;
  late final String message;

  FavouritesData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => FavouritesModel.fromJson(e)).toList();
    status = json['status'] ?? "";
    message = json['message'] ?? "";
  }
}

class FavouritesModel {
  late final num categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final num priceBeforeDiscount;
  late final num price;
  late final double discount;
  late final num amount;
  late final num isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  FavouritesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    code = json['code'] ?? "";
    priceBeforeDiscount = json['price_before_discount'] ?? 0;
    price = json['price'] ?? 0;
    discount = json['discount'] ?? 0.0;
    amount = json['amount'] ?? 0;
    isActive = json['is_active'] ?? 0;
    isFavorite = json['is_favorite'] ?? false;
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
    mainImage = json['main_image'] ?? "";
    createdAt = json['created_at'] ?? "";
  }
}

class Unit {

  late final num id;
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    name = json['name']??"";
    type = json['type']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
  }
}

class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }
}