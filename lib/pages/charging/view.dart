import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'logic.dart';

class ChargingPage extends StatelessWidget {
  final logic = Get.put(ChargingLogic());
  final pageState = Get.find<ChargingLogic>().pageState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("云中邑充电桩状态"),
        ),
        body: Center(child: logic.obx((state) => buildSmartRefresher(),
            onLoading: const CircularProgressIndicator(),
            onError: (msg) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(msg ?? "请检查网络"),
                TextButton(onPressed: logic.onRefresh, child: Text("点击重试"))
              ],
            )
        ))
    );
  }

  SmartRefresher buildSmartRefresher() {
    return SmartRefresher(
      controller: logic.controller,
      onRefresh: logic.onRefresh,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (c, index) {
          var model = pageState.statusList.entries.toList()[index];
          return Column(
            children: [
              Text(
                model.key.toString(),
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 10,
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      //每行3个
                      mainAxisSpacing: 1.0,
                      //主轴(竖直)方向间距
                      crossAxisSpacing: 1.0,
                      //纵轴(水平)方向间距
                      childAspectRatio: 1,
                      //纵轴缩放比例
                      mainAxisExtent: 50),
                  itemBuilder: (c, i) {
                    final socket = model.value[i];
                    return Container(
                      color: socket.status == 1 ? Colors.green : Colors.red,
                      child: Center(
                        child: Text(
                          socket.channel ?? "",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  itemCount: model.value.length,
                  shrinkWrap: true)
            ],
          );
        },
        itemCount: pageState.statusList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 30,
          );
        },
      ),
    );
  }
}
