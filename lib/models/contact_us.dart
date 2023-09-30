class ContactModel {
  late final String phone;
  late final String email;
  late final String location;

  ContactModel.fromJson(Map<String, dynamic> json){
    phone = json['phone'] ?? "";
    email = json['email'] ?? "";
    location = json['location'] ?? "";
  }
}
