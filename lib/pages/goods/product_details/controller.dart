import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProductDetailsController();

  // 商品 id , 获取路由传递参数
  int? productId = Get.arguments['id'] ?? 0;
  // 商品详情
  ProductModel? product;
  // Banner 数据
  List<KeyValueModel> bannerItems = [];
  // Banner 当前位置
  int bannerCurrentIndex = 0;

  // tab 控制器
  late TabController tabController;
  // tab 控制器
  int tabIndex = 0;

  // 颜色列表
  List<KeyValueModel<AttributeModel>> colors = [];
  // 选中颜色列表
  List<String> colorKeys = [];

  // 尺寸列表
  List<KeyValueModel<AttributeModel>> sizes = [];
  // 选中尺寸列表
  List<String> sizeKeys = [];

  // 评论 刷新控制器
  final RefreshController reviewsRefreshController = RefreshController(
    initialRefresh: true,
  );
  // reviews 评论列表
  List<ReviewModel> reviews = [];
  // 评论图片列表 测试用
  List<String> reviewImages = [];
  // 评论 页码
  int _reviewsPage = 1;
  // 评论 页尺寸
  final int _reviewsLimit = 20;

  // 加入购物车
  void onAddCartTap() async {
    // 检查是否登录
    if (!await UserService.to.checkIsLogin()) {
      return;
    }

    // 检查空
    if (product == null || product?.id == null) {
      Loading.error("product is empty");
      return;
    }

    // 加入购物车
    CartService.to.addCart(LineItem(
      productId: productId,
      product: product,
    ));
    // 返回、或者去购物车
    Get.back();
  }

  // 读取缓存
  _loadCache() async {
    // 颜色列表
    var stringColors =
        Storage().getString(Constants.storageProductsAttributesColors);

    colors = stringColors != ""
        ? jsonDecode(stringColors).map<KeyValueModel<AttributeModel>>((item) {
            var arrt = AttributeModel.fromJson(item);
            return KeyValueModel(key: "${arrt.name}", value: arrt);
          }).toList()
        : [];

    // 尺寸列表
    var stringSizes =
        Storage().getString(Constants.storageProductsAttributesSizes);

    sizes = stringSizes != ""
        ? jsonDecode(stringSizes).map<KeyValueModel<AttributeModel>>((item) {
            var arrt = AttributeModel.fromJson(item);
            return KeyValueModel(key: "${arrt.name}", value: arrt);
          }).toList()
        : [];
  }

  // 颜色选中
  void onColorTap(List<String> keys) {
    colorKeys = keys;
    update(["product_colors"]);
  }

  // 尺寸选中
  void onSizeTap(List<String> keys) {
    sizeKeys = keys;
    update(["product_sizes"]);
  }

  // 拉取商品详情
  _loadProduct() async {
    // 商品详情
    product = await ProductApi.productDetail(productId);

    // Banner 数据
    if (product?.images != null) {
      bannerItems = product!.images!
          .map<KeyValueModel>((e) => KeyValueModel(
                key: "${e.id}",
                value: e.src ?? "",
              ))
          .toList();
    }

    // 选中值
    if (product?.attributes != null) {
      // 颜色
      var colorAttr = product?.attributes?.where((e) => e.name == "Color");
      if (colorAttr?.isNotEmpty == true) {
        colorKeys = colorAttr?.first.options ?? [];
      }
      // 尺寸
      var sizeAttr = product?.attributes?.where((e) => e.name == "Size");
      if (sizeAttr?.isNotEmpty == true) {
        sizeKeys = sizeAttr?.first.options ?? [];
      }
    }
    // 评论
    reviews = await ProductApi.reviews(ReviewsReq(
      product: productId,
    ));

    // 评论图片，测试用
    reviewImages.addAll([
      "https://ducafecat.oss-cn-beijing.aliyuncs.com/bag/718Y%2BhJkMgL._AC_UY695_.jpg",
      "https://ducafecat.oss-cn-beijing.aliyuncs.com/bag/71n8Tg2ClZL._AC_UY695_.jpg",
      "https://ducafecat.oss-cn-beijing.aliyuncs.com/bag/819mEKajDML._AC_UY695_.jpg",
      "https://ducafecat.oss-cn-beijing.aliyuncs.com/bag/81J0UFuJHdL._AC_UY695_.jpg",
      "https://ducafecat.oss-cn-beijing.aliyuncs.com/bag/81M4BxGW4TL._AC_UY695_.jpg",
      "https://ducafecat.oss-cn-beijing.aliyuncs.com/bag/81s6OXEsZCL._AC_UY695_.jpg",
    ]);
  }

  // 评论 拉取数据
  Future<bool> _loadReviews(bool isRefresh) async {
    // 拉取数据
    // 评论
    var reviewsListTmp = await ProductApi.reviews(ReviewsReq(
      // 刷新, 重置页数1
      page: isRefresh ? 1 : _reviewsPage,
      // 每页条数
      prePage: _reviewsLimit,
      // 商品id
      product: productId,
    ));

    // 更新数据
    if (isRefresh) {
      _reviewsPage = 1; // 重置页数1
      reviews.clear(); // 清空数据
    }

    if (reviewsListTmp.isNotEmpty) {
      _reviewsPage++; // 页数+1
      reviews.addAll(reviewsListTmp); // 添加数据
    }

    return reviewsListTmp.isEmpty;
  }

  // 评论 下拉刷新
  void onReviewsRefresh() async {
    try {
      // 拉取数据是否为空
      await _loadReviews(true);

      // 刷新完成
      reviewsRefreshController.refreshCompleted();
    } catch (error) {
      // 刷新失败
      reviewsRefreshController.refreshFailed();
    }
    update(["product_reviews"]);
  }

  // 评论 上拉载入新商品
  void onReviewsLoading() async {
    if (reviews.isNotEmpty) {
      try {
        // 拉取数据是否为空
        var isEmpty = await _loadReviews(false);

        if (isEmpty) {
          // 设置无数据
          reviewsRefreshController.loadNoData();
        } else {
          // 加载完成
          reviewsRefreshController.loadComplete();
        }
      } catch (e) {
        // 加载失败
        reviewsRefreshController.loadFailed();
      }
    } else {
      // 设置无数据
      reviewsRefreshController.loadNoData();
    }
    update(["product_reviews"]);
  }

  // Banner 切换事件
  void onChangeBanner(int index, reason) {
    bannerCurrentIndex = index;
    update(["product_banner"]); // 手动刷新 Banner
  }

  // 图片浏览
  void onGalleryTap(int index, KeyValueModel item) {
    Get.to(GalleryWidget(
      initialIndex: index,
      items: bannerItems.map<String>((e) => e.value!).toList(),
    ));
  }

  // 切换 tab
  void onTapBarTap(int index) {
    tabIndex = index;
    tabController.animateTo(index);
    update(["product_tab"]);
  }

  // 评论图片浏览
  void onReviewsGalleryTap(int index) {
    Get.to(GalleryWidget(
      initialIndex: index,
      items: reviewImages,
    ));
  }

  _initData() async {
    await _loadProduct();
    await _loadCache();
    update(["product_details"]);
  }

  @override
  void onInit() {
    super.onInit();
    // 初始化 tab 控制器
    tabController = TabController(length: 3, vsync: this);
    // 监听 tab 切换
    tabController.addListener(() {
      tabIndex = tabController.index;
      update(['product_tab']);
    });
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
    reviewsRefreshController.dispose();
  }
}
