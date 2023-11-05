import 'package:meta/meta.dart';
import 'dart:convert';

class WaybillSuccessResponseModel {
  final Rajaongkir rajaongkir;

  WaybillSuccessResponseModel({
    required this.rajaongkir,
  });

  factory WaybillSuccessResponseModel.fromJson(String str) =>
      WaybillSuccessResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WaybillSuccessResponseModel.fromMap(Map<String, dynamic> json) =>
      WaybillSuccessResponseModel(
        rajaongkir: Rajaongkir.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir.toMap(),
      };
}

class Rajaongkir {
  final Query query;
  final Status status;
  final Result result;

  Rajaongkir({
    required this.query,
    required this.status,
    required this.result,
  });

  factory Rajaongkir.fromJson(String str) =>
      Rajaongkir.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rajaongkir.fromMap(Map<String, dynamic> json) => Rajaongkir(
        query: Query.fromMap(json["query"]),
        status: Status.fromMap(json["status"]),
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "query": query.toMap(),
        "status": status.toMap(),
        "result": result.toMap(),
      };
}

class Query {
  final String waybill;
  final String courier;

  Query({
    required this.waybill,
    required this.courier,
  });

  factory Query.fromJson(String str) => Query.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Query.fromMap(Map<String, dynamic> json) => Query(
        waybill: json["waybill"],
        courier: json["courier"],
      );

  Map<String, dynamic> toMap() => {
        "waybill": waybill,
        "courier": courier,
      };
}

class Result {
  final bool delivered;
  final Summary summary;
  final Details details;
  final List<Manifest> manifest;
  final DeliveryStatus deliveryStatus;

  Result({
    required this.delivered,
    required this.summary,
    required this.details,
    required this.manifest,
    required this.deliveryStatus,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        delivered: json["delivered"],
        summary: Summary.fromMap(json["summary"]),
        details: Details.fromMap(json["details"]),
        manifest: List<Manifest>.from(
            json["manifest"].map((x) => Manifest.fromMap(x))),
        deliveryStatus: DeliveryStatus.fromMap(json["delivery_status"]),
      );

  Map<String, dynamic> toMap() => {
        "delivered": delivered,
        "summary": summary.toMap(),
        "details": details.toMap(),
        "manifest": List<dynamic>.from(manifest.map((x) => x.toMap())),
        "delivery_status": deliveryStatus.toMap(),
      };
}

class DeliveryStatus {
  final String status;
  final String podReceiver;
  final DateTime podDate;
  final String podTime;

  DeliveryStatus({
    required this.status,
    required this.podReceiver,
    required this.podDate,
    required this.podTime,
  });

  factory DeliveryStatus.fromJson(String str) =>
      DeliveryStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeliveryStatus.fromMap(Map<String, dynamic> json) => DeliveryStatus(
        status: json["status"],
        podReceiver: json["pod_receiver"],
        podDate: DateTime.parse(json["pod_date"]),
        podTime: json["pod_time"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "pod_receiver": podReceiver,
        "pod_date":
            "${podDate.year.toString().padLeft(4, '0')}-${podDate.month.toString().padLeft(2, '0')}-${podDate.day.toString().padLeft(2, '0')}",
        "pod_time": podTime,
      };
}

class Details {
  final String waybillNumber;
  final DateTime waybillDate;
  final String waybillTime;
  final double weight;
  final String origin;
  final String destination;
  final String shippperName;
  final String shipperAddress1;
  final String shipperAddress2;
  final String shipperAddress3;
  final String shipperCity;
  final String receiverName;
  final String receiverAddress1;
  final String receiverAddress2;
  final String receiverAddress3;
  final String receiverCity;

  Details({
    required this.waybillNumber,
    required this.waybillDate,
    required this.waybillTime,
    required this.weight,
    required this.origin,
    required this.destination,
    required this.shippperName,
    required this.shipperAddress1,
    required this.shipperAddress2,
    required this.shipperAddress3,
    required this.shipperCity,
    required this.receiverName,
    required this.receiverAddress1,
    required this.receiverAddress2,
    required this.receiverAddress3,
    required this.receiverCity,
  });

  factory Details.fromJson(String str) => Details.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Details.fromMap(Map<String, dynamic> json) => Details(
        waybillNumber: json["waybill_number"],
        waybillDate: DateTime.parse(json["waybill_date"]),
        waybillTime: json["waybill_time"],
        weight: json["weight"]?.toDouble(),
        origin: json["origin"],
        destination: json["destination"],
        shippperName: json["shippper_name"],
        shipperAddress1: json["shipper_address1"],
        shipperAddress2: json["shipper_address2"],
        shipperAddress3: json["shipper_address3"],
        shipperCity: json["shipper_city"],
        receiverName: json["receiver_name"],
        receiverAddress1: json["receiver_address1"],
        receiverAddress2: json["receiver_address2"],
        receiverAddress3: json["receiver_address3"],
        receiverCity: json["receiver_city"],
      );

  Map<String, dynamic> toMap() => {
        "waybill_number": waybillNumber,
        "waybill_date":
            "${waybillDate.year.toString().padLeft(4, '0')}-${waybillDate.month.toString().padLeft(2, '0')}-${waybillDate.day.toString().padLeft(2, '0')}",
        "waybill_time": waybillTime,
        "weight": weight,
        "origin": origin,
        "destination": destination,
        "shippper_name": shippperName,
        "shipper_address1": shipperAddress1,
        "shipper_address2": shipperAddress2,
        "shipper_address3": shipperAddress3,
        "shipper_city": shipperCity,
        "receiver_name": receiverName,
        "receiver_address1": receiverAddress1,
        "receiver_address2": receiverAddress2,
        "receiver_address3": receiverAddress3,
        "receiver_city": receiverCity,
      };
}

class Manifest {
  final String manifestCode;
  final String manifestDescription;
  final DateTime manifestDate;
  final String manifestTime;
  final String cityName;

  Manifest({
    required this.manifestCode,
    required this.manifestDescription,
    required this.manifestDate,
    required this.manifestTime,
    required this.cityName,
  });

  factory Manifest.fromJson(String str) => Manifest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Manifest.fromMap(Map<String, dynamic> json) => Manifest(
        manifestCode: json["manifest_code"] ?? '-',
        manifestDescription: json["manifest_description"],
        manifestDate: DateTime.parse(json["manifest_date"]),
        manifestTime: json["manifest_time"],
        cityName: json["city_name"],
      );

  Map<String, dynamic> toMap() => {
        "manifest_code": manifestCode,
        "manifest_description": manifestDescription,
        "manifest_date":
            "${manifestDate.year.toString().padLeft(4, '0')}-${manifestDate.month.toString().padLeft(2, '0')}-${manifestDate.day.toString().padLeft(2, '0')}",
        "manifest_time": manifestTime,
        "city_name": cityName,
      };
}

class Summary {
  final String courierCode;
  final String courierName;
  final String waybillNumber;
  final String serviceCode;
  final DateTime waybillDate;
  final String shipperName;
  final String receiverName;
  final String origin;
  final String destination;
  final String status;

  Summary({
    required this.courierCode,
    required this.courierName,
    required this.waybillNumber,
    required this.serviceCode,
    required this.waybillDate,
    required this.shipperName,
    required this.receiverName,
    required this.origin,
    required this.destination,
    required this.status,
  });

  factory Summary.fromJson(String str) => Summary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        courierCode: json["courier_code"],
        courierName: json["courier_name"],
        waybillNumber: json["waybill_number"],
        serviceCode: json["service_code"],
        waybillDate: DateTime.parse(json["waybill_date"]),
        shipperName: json["shipper_name"],
        receiverName: json["receiver_name"],
        origin: json["origin"],
        destination: json["destination"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "courier_code": courierCode,
        "courier_name": courierName,
        "waybill_number": waybillNumber,
        "service_code": serviceCode,
        "waybill_date":
            "${waybillDate.year.toString().padLeft(4, '0')}-${waybillDate.month.toString().padLeft(2, '0')}-${waybillDate.day.toString().padLeft(2, '0')}",
        "shipper_name": shipperName,
        "receiver_name": receiverName,
        "origin": origin,
        "destination": destination,
        "status": status,
      };
}

class Status {
  final int code;
  final String description;

  Status({
    required this.code,
    required this.description,
  });

  factory Status.fromJson(String str) => Status.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "description": description,
      };
}
