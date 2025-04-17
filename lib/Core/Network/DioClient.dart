import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient{
  Dio getInstance (){
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8000/api',
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
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