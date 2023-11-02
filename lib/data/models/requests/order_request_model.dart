import 'dart:convert';

class OrderRequestModel {
  final Data data;

  OrderRequestModel({
    required this.data,
  });

  factory OrderRequestModel.fromJson(String str) =>
      OrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromMap(Map<String, dynamic> json) =>
      OrderRequestModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  final List<Item> items;
  final int totalPrice;
  final String deliveryAddress;
  final String courierName;
  final int courierPrice;
  final String status;

  Data({
    required this.items,
    required this.totalPrice,
    required this.deliveryAddress,
    required this.courierName,
    required this.courierPrice,
    required this.status,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        totalPrice: json["totalPrice"],
        deliveryAddress: json["deliveryAddress"],
        courierName: json["courierName"],
        courierPrice: json["courierPrice"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "totalPrice": totalPrice,
        "deliveryAddress": deliveryAddress,
        "courierName": courierName,
        "courierPrice": courierPrice,
        "status": status,
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
