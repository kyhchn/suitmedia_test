import 'package:dio/dio.dart';
import 'package:suitmedia_test/utils/constant/constant.dart';

class Request {
  final dio = Dio();

  Request() {
    setupDio();
  }

  void setupDio() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }
}
