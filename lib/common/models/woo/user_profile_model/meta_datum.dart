class MetaDatum {
  String? key;
  int? id;
  String? value;

  MetaDatum({this.key, this.id, this.value});

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        key: json['key'] as String?,
        id: json['id'] as int?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'id': id,
        'value': value,
      };
}
