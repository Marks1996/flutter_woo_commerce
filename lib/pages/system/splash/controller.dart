import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  void _jumpToPage() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (!ConfigService.to.isAlreadyOpen) {
        Get.offAllNamed(RouteNames.main);
      } else {
        Get.offAllNamed(RouteNames.systemWelcome);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    // 删除设备启动图
    FlutterNativeSplash.remove();
    _jumpToPage();
  }
}
