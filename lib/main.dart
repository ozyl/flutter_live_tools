import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_live_tools/network/api/charging_api.dart';
import 'package:flutter_live_tools/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => ChargingAPI());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    enableLog: true,
    initialRoute: AppPages.initial,
    getPages: AppPages.routes,
    scrollBehavior: MyCustomScrollBehavior(),
  ));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    ...super.dragDevices,
    PointerDeviceKind.mouse,
  };
}