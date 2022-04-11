import 'package:flutter/foundation.dart';
import 'package:flutter_live_tools/model/device_status.dart';
import 'package:get/get.dart';

import '../dio_library.dart';


class ChargingAPI extends GetxService{

  static ChargingAPI get instance => Get.find<ChargingAPI>();

  final client = HttpClient(dioConfig: HttpConfig(baseUrl: "http://iot.yizhongyun.com/Appapi"));

  Future<HttpResponse<DeviceStatus>> getStatus(int id) async {
    return await client.post("/chargingOperation",data: {"dev_id": id})..parse(DeviceStatus.fromJson);
  }

}