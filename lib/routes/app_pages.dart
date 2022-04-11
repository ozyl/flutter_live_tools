import 'package:flutter_live_tools/pages/charging/view.dart';
import 'package:flutter_live_tools/pages/home/view.dart';
import 'package:get/get.dart';

part 'app_routers.dart';

class AppPages {
  static const initial = Routes.charging;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.charging,
      page: () => ChargingPage(),
    ),
  ];
}