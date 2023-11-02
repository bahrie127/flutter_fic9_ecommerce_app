import 'dart:convert';

class OrderDetailResponseModel {
  final Data data;
  final Meta meta;

  OrderDetailResponseModel({
    required this.data,
    required this.meta,
  });

  factory OrderDetailResponseModel.fromJson(String str) =>
      OrderDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      OrderDetailResponseModel(
        data: Data.fromMap(json["data"]),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
        "meta": meta.toMap(),
      };
}

class Data {
  final int id;
  final Attributes attributes;

  Data({
    required this.id,
    required this.attributes,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: Attributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class Attributes {
  final List<Item> items;
  final int totalPrice;
  final String deliveryAddress;
  final String courierName;
  final int courierPrice;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  Attributes({
    required this.items,
    required this.totalPrice,
    required this.deliveryAddress,
    required this.courierName,
    required this.courierPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory Attributes.fromJson(String str) =>
      Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        totalPrice: json["totalPrice"],
        deliveryAddress: json["deliveryAddress"],
        courierName: json["courierName"],
        courierPrice: json["courierPrice"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "totalPrice": totalPrice,
        "deliveryAddress": deliveryAddress,
        "courierName": courierName,
        "courierPrice": courierPrice,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Item {
  final int id;
  final String productName;
  final int price;
  final int qty;

  Item({
    required this.id,
    required this.productName,
    required this.price,
    required this.qty,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "productName": productName,
        "price": price,
        "qty": qty,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toMap() => {};
}
