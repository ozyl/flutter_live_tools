import 'package:flutter_live_tools/app/ext/ext_kotlin.dart';

import 'http_exceptions.dart';

class HttpResponse<T> {
  late bool ok;
  dynamic? data;
  T? model;
  HttpException? error;

  HttpResponse.success(this.data) {
    ok = true;
  }

  HttpResponse.failure({String? errorMsg, int? errorCode}) {
    error = BadRequestException(message: errorMsg, code: errorCode);
    ok = false;
  }

  HttpResponse.failureFormResponse({dynamic? data}) {
    error = BadResponseException(data);
    ok = false;
  }

  HttpResponse.failureFromError([HttpException? error]) {
    error = error ?? UnknownException();
    ok = false;
  }

  HttpResponse<T> parse([T Function(dynamic)? parser]) {
    if(data is T && parser==null){
      model = data;
      return this;
    }
    if(data!=null && parser!=null){
      model = parser(data);
    }
    return this;
  }

  obx({Function(T model)? onResult,Function(T? model)? onResultOrNull,Function(HttpException? error)? onError}){
    if(ok)  model!=null ? onResult?.call(model!) : onResultOrNull?.call(model);
    if(!ok) onError?.call(error);
  }
}
