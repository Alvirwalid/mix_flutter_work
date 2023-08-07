import 'package:hive/hive.dart';
part 'price_model.g.dart';
@HiveType(typeId: 0)
class PriceModel {
  @HiveField(0)
  List<Data>? data;
  @HiveField(1)
  int? totalPrice;

  PriceModel({this.data, this.totalPrice});

  PriceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}

@HiveType(typeId: 1)
class Data {
  @HiveField(0)
  String? productName;@HiveField(10)
  String? details;@HiveField(2)
  int? price;@HiveField(3)
  bool? isSelect;

  Data({this.productName, this.details, this.price, this.isSelect});

  Data.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    details = json['details'];
    price = json['price'];
    isSelect = json['isSelect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['details'] = this.details;
    data['price'] = this.price;
    data['isSelect'] = this.isSelect;
    return data;
  }
}