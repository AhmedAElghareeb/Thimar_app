class AddressesData {
  late final List<AddressModel> data;
  late final String status;
  late final String message;

  AddressesData.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data'] ?? []).map((e) => AddressModel.fromJson(e)).toList();
    status = json['status'] ?? "";
    message = json['message'] ?? "";
  }
}

class AddressModel {
  late final int id;
  late final String type;
  late final double lat;
  late final double lng;
  late final String location;
  late final String description;
  late final bool isDefault;
  late final String phone;

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    type = json['type'] ?? "";
    lat = double.parse(json['lat'].toString());
    lng = double.parse(json['lng'].toString());
    location = json['location'] ?? "";
    description = json['description'] ?? "";
    isDefault = json['is_default'] ?? false;
    phone = json['phone'] ?? 0;
  }
}
