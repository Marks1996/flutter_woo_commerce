import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce/common/index.dart';

/// 主导航栏
AppBar mainAppBarWidget({
  Key? key,
  Function()? onTap, // 点击事件
  Widget? leading, // 左侧按钮
  String? hintText, // 输入框默认提示文字
  String? titleString, // 标题
  double? titleSpace, // 标题间距
  double? iconSize, // 图标大小
}) {
  return AppBar(
    leading: leading,
    titleSpacing: titleSpace ?? AppSpace.listItem,
    title: hintText != null
        ? InputWidget.textBorder(
            hintText: hintText,
            readOnly: true,
            onTap: onTap,
          )
        : Text(titleString ?? ""),
    actions: [
      // 搜索
      IconWidget.svg(
        AssetsSvgs.iSearchSvg,
        size: iconSize ?? 20,
      ).paddingRight(AppSpace.listItem),

      // 消息
      IconWidget.svg(
        AssetsSvgs.iNotificationsSvg,
        size: iconSize ?? 20,
        isDot: true,
      ).unconstrained().paddingRight(AppSpace.listItem),

      // 更多
      IconWidget.svg(
        AssetsSvgs.iIndicatorsSvg,
        size: iconSize ?? 20,
      ).paddingRight(AppSpace.page),
    ],
  );
}
