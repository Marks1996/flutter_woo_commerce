import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  _jumpToPage() {
    // 欢迎页
    if (ConfigService.to.isAlreadyOpen) {
      Get.offAllNamed(RouteNames.systemWelcome);
    } else {
      Get.offAllNamed(RouteNames.main);
    }
  }

  @override
  void onReady() {
    super.onReady();
    // 删除设备启动图
    FlutterNativeSplash.remove();
    _jumpToPage();
  }
}
