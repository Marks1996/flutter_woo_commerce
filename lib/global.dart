import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    /// 初始化
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      /// 工具类
      Storage().init(),
      /// 服务类
      Get.putAsync<ConfigService>(() async => await ConfigService().init()),
    ]).whenComplete(() {});
  }
}
