import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  ApiClient({required this.appBaseUrl});

  final String appBaseUrl;

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(appBaseUrl + uri);
      return response;
    } catch (e) {
      print('catche e  ');
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
