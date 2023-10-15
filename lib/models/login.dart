class UserModel {
  late final int id;
  late final String fullname;
  late final String phone;
  late final String email;
  late final String image;
  late final num isBan;
  late final bool isActive;
  late final int unreadNotifications;
  late final String userType;
  late final String token;
  late final int userCartCount;
  late final City city;

  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    fullname = json['fullname'] ?? "";
    phone = json['phone'] ?? "";
    email = json['email'] ?? "";
    image = json['image'] ?? "";
    isBan = json['is_ban'] ?? 0;
    isActive = json['is_active'] ?? false;
    unreadNotifications = json['unread_notifications'] ?? 0;
    userType = json['user_type'] ?? "";
    token = json['token'] ?? "";
    userCartCount = json['user_cart_count'] ?? 0;
    city = City.fromJson(json["city"]);
  }
}

class City {
  late final String id;
  late final String name;

  City.fromJson(Map<String, dynamic> json){
    id = json['id'].toString();
    name = json['name'] ?? "";
  }
}
