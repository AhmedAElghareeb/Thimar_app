class SearchData {
  late final String status;
  late final String message;
  late final Data data;

  SearchData.fromJson(Map<String, dynamic> json){
    status = json['status'] ?? "";
    message = json['message'] ?? "";
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<SearchResult> searchResult;

  Data.fromJson(Map<String, dynamic> json){
    searchResult = List.from(json['search_result'] ?? []).map((e)=>SearchResult.fromJson(e)).toList();
  }
}

class SearchResult {
  late final num categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final num priceBeforeDiscount;
  late final num price;
  late final num discount;
  late final double amount;
  late final num isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<dynamic> images;
  late final String mainImage;
  late final String createdAt;

  SearchResult.fromJson(Map<String, dynamic> json){
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
    isFavorite = json['is_favorite'] ?? false;
    unit = Unit.fromJson(json['unit']);
    images = List.castFrom<dynamic, dynamic>(json['images'] ?? []);
    mainImage = json['main_image'] ?? "";
    createdAt = json['created_at'] ?? "";
  }
}

class Unit {
  late final int id;
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