import 'package:meta/meta.dart';
import 'dart:convert';

class WaybillFailedResponseModel {
    final Rajaongkir rajaongkir;

    WaybillFailedResponseModel({
        required this.rajaongkir,
    });

    factory WaybillFailedResponseModel.fromJson(String str) => WaybillFailedResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory WaybillFailedResponseModel.fromMap(Map<String, dynamic> json) => WaybillFailedResponseModel(
        rajaongkir: Rajaongkir.fromMap(json["rajaongkir"]),
    );

    Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir.toMap(),
    };
}

class Rajaongkir {
    final Query query;
    final Status status;
    final dynamic result;

    Rajaongkir({
        required this.query,
        required this.status,
        required this.result,
    });

    factory Rajaongkir.fromJson(String str) => Rajaongkir.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Rajaongkir.fromMap(Map<String, dynamic> json) => Rajaongkir(
        query: Query.fromMap(json["query"]),
        status: Status.fromMap(json["status"]),
        result: json["result"],
    );

    Map<String, dynamic> toMap() => {
        "query": query.toMap(),
        "status": status.toMap(),
        "result": result,
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
