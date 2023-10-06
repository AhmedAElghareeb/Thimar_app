class ProductsDetails {
  late final String status;
  late final String message;
  late final ProductDetailsData data;

  ProductsDetails.fromJson(Map<String, dynamic> json){
    status = json['status'] ?? "";
    message = json['message'] ?? "";
    data = ProductDetailsData.fromJson(json['data']);
  }
}

class ProductDetailsData {
  late final num categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final num priceBeforeDiscount;
  late final num price;
  late final num discount;
  late final num amount;
  late final num isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<ImageModel> images;
  late final String mainImage;
  late final String createdAt;

  ProductDetailsData.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    code = json['code'] ?? "";
    priceBeforeDiscount = json['price_before_discount'] ?? 0;
    price = json['price'] ?? 0;
    discount = json['discount'] ?? 0;
    amount = json['amount'] ?? 0;
    isActive = json['is_active'] ?? 0;
    isFavorite = json['is_favorite'] ?? "";
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e) => ImageModel.fromJson(e)).toList();
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
    name = json['name'] ?? "";
    type = json['type'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }
}

class ImageModel {
  late final String name;
  late final String url;

  ImageModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }
}
