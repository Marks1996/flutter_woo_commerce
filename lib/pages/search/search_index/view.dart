import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SearchIndexPage extends GetView<SearchIndexController> {
  const SearchIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SearchIndexPage"),
    );
  }

// 导航栏
  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget.textBorder(
        controller: controller.searchEditController,
        hintText: "You can try T-Shirt", //LocaleKeys.commonSearchInput.tr,
        onChanged: (val) {
          printInfo(info: val);
        },
      ).paddingRight(AppSpace.page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchIndexController>(
      init: SearchIndexController(),
      id: "search_index",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
