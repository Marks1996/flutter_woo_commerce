import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../index.dart';

/// 评论
class TabReviewsView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabReviewsView({Key? key, required this.uniqueTag}) : super(key: key);

  @override
  String? get tag => uniqueTag;

  // 星星
  _buildRatingBar(ReviewModel item) {
    return RatingBar.builder(
      initialRating: item.rating?.toDouble() ?? 0,
      minRating: 1,
      direction: Axis.horizontal,
      ignoreGestures: true,
      itemSize: 20,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: AppColors.primary,
      ),
      onRatingUpdate: (rating) {},
    );
  }

  // 评论图
  Widget _buildReviewImages() {
    return List.generate(
      controller.reviewImages.length,
      (index) => ImageWidget.url(
        controller.reviewImages[index],
        width: 45.w,
        height: 45.w,
      ),
    ).toWrap(
      spacing: AppSpace.listItem,
      runSpacing: AppSpace.listItem,
    );
  }

  // 列表项
  _buildListItem(ReviewModel item) {
    return <Widget>[
      // 头像
      ImageWidget.url(
        item.reviewerAvatarUrls?["96"]?.toString() ?? "",
        // 测试需要改成自定义头像
        // "https://ducafecat.oss-cn-beijing.aliyuncs.com/avatar/00258VC3ly1gty0r05zh2j60ut0u0tce02.jpg",
        width: 55,
        height: 55,
      ).paddingRight(AppSpace.listItem),

      // 星、名称、评论、图
      <Widget>[
        // 星
        _buildRatingBar(item),
        <Widget>[
          // 名称
          TextWidget.title3(
            item.reviewer ?? "",
          ),
          // 时间
          TextWidget.body2(
            item.dateCreated?.toString() ?? "",
          ),
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        // 评论
        TextWidget.body1(
          item.review?.clearHtml ?? "",
        ),
        // 图
        _buildReviewImages(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .expanded(),
    ].toRow(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      tag: tag,
      id: "product_reviews",
      builder: (_) {
        return SmartRefresher(
          // 刷新控制器
          controller: controller.reviewsRefreshController,
          // 启用上拉加载
          enablePullUp: true,
          // 下拉刷新回调
          onRefresh: controller.onReviewsRefresh,
          // 上拉加载回调
          onLoading: controller.onReviewsLoading,
          // 底部加载更多
          footer: const SmartRefresherFooterWidget(),
          // 分隔符、间距
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              var item = controller.reviews[index];
              return _buildListItem(item);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: AppSpace.listRow * 2);
            },
            itemCount: controller.reviews.length,
          ),
        );
      },
    );
  }
}
