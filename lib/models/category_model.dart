class CategoriesModel {
  late final List<CategoriesData> data;
  CategoriesModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']??[]).map((e)=>CategoriesData.fromJson(e)).toList();
  }
}
class CategoriesData {
  late final int id;
  late final String name;
  late final String description;
  late final String media;

  CategoriesData.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
    description = json['description']??"";
    media = json['media']??"";
  }
}