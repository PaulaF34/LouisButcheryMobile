import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  Dio getInstance() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.22:8000/api/auth',
        connectTimeout: Duration(seconds: 50),
        receiveTimeout: Duration(seconds: 50),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
        headers: {
          'Accept': 'application/json', // ✅ This fixes the redirect issue
        },
      ),
    );

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

    return dio;
  }
}
