import 'collection.dart';
import 'customer.dart';
import 'self.dart';

class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<Customer>? customer;

  Links({this.self, this.collection, this.customer});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: (json['self'] as List<dynamic>?)
            ?.map((e) => Self.fromJson(e as Map<String, dynamic>))
            .toList(),
        collection: (json['collection'] as List<dynamic>?)
            ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
            .toList(),
        customer: (json['customer'] as List<dynamic>?)
            ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'self': self?.map((e) => e.toJson()).toList(),
        'collection': collection?.map((e) => e.toJson()).toList(),
        'customer': customer?.map((e) => e.toJson()).toList(),
      };
}
