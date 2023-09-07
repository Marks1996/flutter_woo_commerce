class ShippingLine {
  List<String>? taxes;
  String? totalTax;
  String? instanceId;
  String? methodTitle;
  int? id;
  String? methodId;
  List<String>? metaData;
  String? total;

  ShippingLine({
    this.taxes,
    this.totalTax,
    this.instanceId,
    this.methodTitle,
    this.id,
    this.methodId,
    this.metaData,
    this.total,
  });

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
        taxes: json['taxes'] as List<String>?,
        totalTax: json['total_tax'] as String?,
        instanceId: json['instance_id'] as String?,
        methodTitle: json['method_title'] as String?,
        id: json['id'] as int?,
        methodId: json['method_id'] as String?,
        metaData: json['meta_data'] as List<String>?,
        total: json['total'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'taxes': taxes,
        'total_tax': totalTax,
        'instance_id': instanceId,
        'method_title': methodTitle,
        'id': id,
        'method_id': methodId,
        'meta_data': metaData,
        'total': total,
      };
}
