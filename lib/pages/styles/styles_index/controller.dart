import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();
  // 多语言
  onLanguageSelected() {
    // var en = Translation.supportedLocales[0];
    // var zh = Translation.supportedLocales[1];

    final [en, zh] = Translation.supportedLocales;
    ConfigService.to.onLocaleUpdate(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
    update(["styles_index"]);
  }

  _initData() {
    Storage().remove(Constants.storageLanguageCode);
    update(["styles_index"]);
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
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
