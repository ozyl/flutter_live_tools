import 'dart:io';

import 'package:flutter_live_tools/model/charging_device.dart';
import 'package:flutter_live_tools/network/api/charging_api.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'state.dart';

class ChargingLogic extends GetxController  with StateMixin<RxMap<ChargingDevice,List<Socket>>> {
  final ChargingState pageState = ChargingState();

  final RefreshController controller = RefreshController();

  getStatus(ChargingDevice device) async {
    var status = await ChargingAPI.instance.getStatus(device.id);
    status.obx(
      onResult: (model){
        pageState.statusList[device] = model.socket??[];
      },
      onError: (e){
        Get.snackbar('加载失败', '$device',snackStyle: SnackStyle.GROUNDED,duration: const Duration(seconds: 1));
      }
    );
  }

  @override
  void onReady() {
    onRefresh();
  }

  void onRefresh() async {

    if(pageState.statusList.isEmpty) {
      change(null, status: RxStatus.loading());
    }
    for (var element in pageState.deviceIds) {
      await getStatus(element);
    }
    if(pageState.statusList.isEmpty){
      change(null,status:RxStatus.error());
    }else{
      change(null,status:RxStatus.success());
    }
    controller.refreshCompleted();
  }
}
