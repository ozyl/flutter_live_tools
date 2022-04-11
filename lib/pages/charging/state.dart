import 'package:flutter_live_tools/model/charging_device.dart';
import 'package:flutter_live_tools/model/device_status.dart';
import 'package:get/get.dart';

class ChargingState {
  var deviceIds = [ChargingDevice(61039963,"近的"),ChargingDevice(61039962,"远的")];

  final statusList = RxMap<ChargingDevice,List<Socket>>();
}
