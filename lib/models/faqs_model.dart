class FaqsModel {
  late final List<FaqsData> data;
  late final String status;
  late final String message;

  FaqsModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>FaqsData.fromJson(e)).toList();
    status = json['status'] ?? "";
    message = json['message'] ?? "";
  }
}

class FaqsData {
  late final int id;
  late final String question;
  late final String answer;

  FaqsData.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    question = json['question'] ?? "";
    answer = json['answer'] ?? "";
  }
}