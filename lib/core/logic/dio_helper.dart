import 'package:dio/dio.dart';

class DioHelper {
  Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://thimar.amr.aait-d.com/public/api/",
    ),
  );

  Future<MultiResponse> sendData(String endPoint, {Map<String, dynamic>? data}) async {
    print("(POST) https://thimar.amr.aait-d.com/public/api/$endPoint",);
    print("Data: $data",);
    try {
      final response = await _dio.post(
        endPoint,
        data: data,
      );
      print(response.data);
      return MultiResponse(
        isSuccess: true,
        message: response.data["message"],
        response: response,
      );
    } on DioException catch (ex)
    {
      return MultiResponse(
        message: ex.response?.data["message"],
        isSuccess: false,
        response: ex.response,
      );
    }
  }


  void getData() {

  }


}


class MultiResponse
{
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  MultiResponse({
    required this.message,
    required this.isSuccess,
    this.response,
});
}