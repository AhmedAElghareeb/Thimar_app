class GetCitiesData {
  late final List<CityModel> list;
  late final String status;
  late final String message;

  GetCitiesData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>CityModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class CityModel {
  late final String id;
  late final String name;

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }
}