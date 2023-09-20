class LoginModel {
  late final Data data;
  late final String status;
  late final String message;

  LoginModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  late final int id;
  late final String fullname;
  late final String phone;
  late final String email;
  late final String image;
  late final int isBan;
  late final bool isActive;
  late final int unreadNotifications;
  late final String userType;
  late final String token;
  late final int userCartCount;
  late final City city;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    isBan = json['is_ban'];
    isActive = json['is_active'];
    unreadNotifications = json['unread_notifications'];
    userType = json['user_type'];
    token = json['token'];
    userCartCount = json['user_cart_count'];
    city = City.fromJson(json["city"]);
  }
}

class City {
  late final String id;
  late final String name;

  City.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? "";
    name = json['name'] ?? "";
  }
}
