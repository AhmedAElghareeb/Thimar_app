class CityModel {
  late final String id;
  late final String name;

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? "";
    name = json['name'] ?? "";
  }
}