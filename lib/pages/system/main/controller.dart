import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  // 分页管理
  final PageController pageController = PageController();
  // 当前的 tab index
  int currentIndex = 0;

  // 导航栏切换
  void onIndexChanged(int index) {
    currentIndex = index;
    update(['navigation']);
  }

  // 切换页面
  void onJumpToPage(int page) {
    if ((page != 0) && !UserService.to.isLogin) {
      Get.toNamed(RouteNames.systemLogin);
    } else {
      pageController.jumpToPage(page);
    }
  }

  _initData() async {
    // 读取用户 profile
    await UserService.to.getProfile();

    update(["main"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
