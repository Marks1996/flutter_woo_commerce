import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  _jumpToPage() {
    Get.offAllNamed(RouteNames.systemRegister);
  }

  _initData() {
    update(["main"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
    _jumpToPage();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
