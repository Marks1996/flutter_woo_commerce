import 'date_created.dart';
import 'date_modified.dart';

class Value {
  int? id;
  String? code;
  String? amount;
  String? status;
  DateCreated? dateCreated;
  DateModified? dateModified;
  dynamic dateExpires;
  String? discountType;
  String? description;
  int? usageCount;
  bool? individualUse;
  List<String>? productIds;
  List<String>? excludedProductIds;
  int? usageLimit;
  int? usageLimitPerUser;
  dynamic limitUsageToXItems;
  bool? freeShipping;
  List<String>? productCategories;
  List<String>? excludedProductCategories;
  bool? excludeSaleItems;
  String? minimumAmount;
  String? maximumAmount;
  List<String>? emailRestrictions;
  bool? virtual;
  List<String>? metaData;

  Value({
    this.id,
    this.code,
    this.amount,
    this.status,
    this.dateCreated,
    this.dateModified,
    this.dateExpires,
    this.discountType,
    this.description,
    this.usageCount,
    this.individualUse,
    this.productIds,
    this.excludedProductIds,
    this.usageLimit,
    this.usageLimitPerUser,
    this.limitUsageToXItems,
    this.freeShipping,
    this.productCategories,
    this.excludedProductCategories,
    this.excludeSaleItems,
    this.minimumAmount,
    this.maximumAmount,
    this.emailRestrictions,
    this.virtual,
    this.metaData,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        id: json['id'] as int?,
        code: json['code'] as String?,
        amount: json['amount'] as String?,
        status: json['status'] as String?,
        dateCreated: json['date_created'] == null
            ? null
            : DateCreated.fromJson(
                json['date_created'] as Map<String, dynamic>),
        dateModified: json['date_modified'] == null
            ? null
            : DateModified.fromJson(
                json['date_modified'] as Map<String, dynamic>),
        dateExpires: json['date_expires'] as dynamic,
        discountType: json['discount_type'] as String?,
        description: json['description'] as String?,
        usageCount: json['usage_count'] as int?,
        individualUse: json['individual_use'] as bool?,
        productIds: json['product_ids'] as List<String>?,
        excludedProductIds: json['excluded_product_ids'] as List<String>?,
        usageLimit: json['usage_limit'] as int?,
        usageLimitPerUser: json['usage_limit_per_user'] as int?,
        limitUsageToXItems: json['limit_usage_to_x_items'] as dynamic,
        freeShipping: json['free_shipping'] as bool?,
        productCategories: json['product_categories'] as List<String>?,
        excludedProductCategories:
            json['excluded_product_categories'] as List<String>?,
        excludeSaleItems: json['exclude_sale_items'] as bool?,
        minimumAmount: json['minimum_amount'] as String?,
        maximumAmount: json['maximum_amount'] as String?,
        emailRestrictions: json['email_restrictions'] as List<String>?,
        virtual: json['virtual'] as bool?,
        metaData: json['meta_data'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'amount': amount,
        'status': status,
        'date_created': dateCreated?.toJson(),
        'date_modified': dateModified?.toJson(),
        'date_expires': dateExpires,
        'discount_type': discountType,
        'description': description,
        'usage_count': usageCount,
        'individual_use': individualUse,
        'product_ids': productIds,
        'excluded_product_ids': excludedProductIds,
        'usage_limit': usageLimit,
        'usage_limit_per_user': usageLimitPerUser,
        'limit_usage_to_x_items': limitUsageToXItems,
        'free_shipping': freeShipping,
        'product_categories': productCategories,
        'excluded_product_categories': excludedProductCategories,
        'exclude_sale_items': excludeSaleItems,
        'minimum_amount': minimumAmount,
        'maximum_amount': maximumAmount,
        'email_restrictions': emailRestrictions,
        'virtual': virtual,
        'meta_data': metaData,
      };
}
