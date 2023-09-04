import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchIndexController extends GetxController {
  SearchIndexController();
  // 搜索控制器
  final TextEditingController searchEditController = TextEditingController();
  // 搜索关键词
  final searchKeyWord = "".obs;

  // 搜索栏位 - 防抖
  void _searchDebounce() {
    // getx 内置防抖处理
    debounce(
      // obs 对象
      searchKeyWord,
      // 回调函数
      (value) async {
        // 调试
        if (kDebugMode) {
          print("debounce -> $value");
        }
        // 拉取数据
        update(["search_index"]);
      },
      // 延迟 500 毫秒
      time: 500.milliseconds,
    );

    // 监听搜索框变化
    searchEditController.addListener(() {
      searchKeyWord.value = searchEditController.text;
    });
  }

  _initData() {
    update(["search_index"]);
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
    // 注册防抖
    _searchDebounce();
  }

  @override
  void onClose() {
    super.onClose();
    // 搜索控制器释放
    searchEditController.dispose();
  }
}
