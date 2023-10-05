class FavouritesModel{
  late int id;
  late final String image, title, body, priceBefore, priceAfter, discount;

  FavouritesModel({
    this.id = 0,
    required this.image,
    required this.title,
    required this.body,
    required this.priceBefore,
    required this.priceAfter,
    required this.discount,
  });

  FavouritesModel.fromJson(Map<String, dynamic> json){
    image = json["image"];
    title = json["title"];
    body = json["body"];
    priceBefore = json["priceBefore"];
    priceAfter = json["priceAfter"];
    discount = json["discount"];
  }
}