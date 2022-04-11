import 'package:flutter/material.dart';
import 'package:flutter_live_tools/routes/app_pages.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('生活工具'),
      ),
      body: Center(child: TextButton(onPressed: () {
        Get.toNamed(Routes.charging);
      },
      child
          : const Text("云中邑充电桩"))),
    );
  }
}
