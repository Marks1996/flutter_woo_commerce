import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';

class BuyNowController extends GetxController {
  BuyNowController({required this.product});

  // 商品详情
  final ProductModel product;

  // 支付方式图标
  List<String> paymentList = [
    AssetsImages.pVisaPng,
    AssetsImages.pCashPng,
    AssetsImages.pMastercardPng,
    AssetsImages.pPaypalPng,
  ];

  // 下单 checkout
  void onCheckout() async {}

  _initData() {
    update(["buy_now"]);
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
