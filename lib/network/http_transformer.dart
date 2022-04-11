import 'package:dio/dio.dart';

import 'dio_library.dart';


/// Response 解析
abstract class HttpTransformer {
  HttpResponse<T> parse<T>(Response response);
}





