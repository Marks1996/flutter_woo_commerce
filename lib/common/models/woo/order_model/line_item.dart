class LineItem {
  int? quantity;
  String? totalTax;
  String? subtotalTax;
  int? id;
  String? total;
  String? name;
  dynamic parentName;
  int? productId;
  String? subtotal;
  int? variationId;
  String? sku;
  List<String>? metaData;
  int? price;
  String? taxClass;
  List<String>? taxes;

  LineItem({
    this.quantity,
    this.totalTax,
    this.subtotalTax,
    this.id,
    this.total,
    this.name,
    this.parentName,
    this.productId,
    this.subtotal,
    this.variationId,
    this.sku,
    this.metaData,
    this.price,
    this.taxClass,
    this.taxes,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        quantity: json['quantity'] as int?,
        totalTax: json['total_tax'] as String?,
        subtotalTax: json['subtotal_tax'] as String?,
        id: json['id'] as int?,
        total: json['total'] as String?,
        name: json['name'] as String?,
        parentName: json['parent_name'] as dynamic,
        productId: json['product_id'] as int?,
        subtotal: json['subtotal'] as String?,
        variationId: json['variation_id'] as int?,
        sku: json['sku'] as String?,
        metaData: json['meta_data'] as List<String>?,
        price: json['price'] as int?,
        taxClass: json['tax_class'] as String?,
        taxes: json['taxes'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'total_tax': totalTax,
        'subtotal_tax': subtotalTax,
        'id': id,
        'total': total,
        'name': name,
        'parent_name': parentName,
        'product_id': productId,
        'subtotal': subtotal,
        'variation_id': variationId,
        'sku': sku,
        'meta_data': metaData,
        'price': price,
        'tax_class': taxClass,
        'taxes': taxes,
      };
}
