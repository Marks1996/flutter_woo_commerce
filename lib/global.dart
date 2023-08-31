import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 初始化
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Future.wait([
      // 工具类
      Storage().init(),

      // 服务类
      Get.putAsync<ConfigService>(() async => await ConfigService().init())
    ]).whenComplete(() {});

    // Dio服务
    Get.put<WPHttpService>(WPHttpService());
    // 用户
    Get.put<UserService>(UserService());

    // 吐司弹窗
    Loading();
  }
}
