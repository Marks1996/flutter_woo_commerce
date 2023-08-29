import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();

  // 多语言
  void onLanguageSelected() {
    // var en = Translation.supportedLocales[0];
    // var zh = Translation.supportedLocales[1];
    final [en, zh] = Translation.supportedLocales;
    ConfigService.to.onLocaleUpdate(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
    update(["styles_index"]);
  }

  // 主题
  void onThemeSelected() async {
    await ConfigService.to.switchThemeModel();
    update(["styles_index"]);
  }

  _initData() {
    Storage().remove(Constants.storageLanguageCode);
    update(["styles_index"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
