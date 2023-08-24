import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../index.dart';

/// 配置服务
class ConfigService extends GetxService {
  // 这是一个单例写法
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  /// 当前语言
  // Locale locale = PlatformDispatcher.instance.locale;
  Locale locale = Translation.locale ?? PlatformDispatcher.instance.locale;

  @override
  void onReady() {
    Translation.locale ?? PlatformDispatcher.instance.locale;
    super.onReady();
    initLocale();
  }

  // 初始化
  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.toLanguageTag() == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }
}
