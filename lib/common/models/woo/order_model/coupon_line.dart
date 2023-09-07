import 'meta_datum.dart';

class CouponLine {
  String? code;
  List<MetaDatum>? metaData;
  String? discount;
  int? id;
  String? discountTax;

  CouponLine({
    this.code,
    this.metaData,
    this.discount,
    this.id,
    this.discountTax,
  });

  factory CouponLine.fromJson(Map<String, dynamic> json) => CouponLine(
        code: json['code'] as String?,
        metaData: (json['meta_data'] as List<dynamic>?)
            ?.map((e) => MetaDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        discount: json['discount'] as String?,
        id: json['id'] as int?,
        discountTax: json['discount_tax'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'meta_data': metaData?.map((e) => e.toJson()).toList(),
        'discount': discount,
        'id': id,
        'discount_tax': discountTax,
      };
}
