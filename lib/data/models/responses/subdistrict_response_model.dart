import 'dart:convert';

import 'package:meta/meta.dart';

class SubDistrictResponseModel {
  final Rajaongkir rajaongkir;

  SubDistrictResponseModel({
    required this.rajaongkir,
  });

  factory SubDistrictResponseModel.fromJson(String str) =>
      SubDistrictResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubDistrictResponseModel.fromMap(Map<String, dynamic> json) =>
      SubDistrictResponseModel(
        rajaongkir: Rajaongkir.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir.toMap(),
      };
}

class Rajaongkir {
  final Query query;
  final Status status;
  final List<SubDistrict> results;

  Rajaongkir({
    required this.query,
    required this.status,
    required this.results,
  });

  factory Rajaongkir.fromJson(String str) =>
      Rajaongkir.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rajaongkir.fromMap(Map<String, dynamic> json) => Rajaongkir(
        query: Query.fromMap(json["query"]),
        status: Status.fromMap(json["status"]),
        results: List<SubDistrict>.from(
            json["results"].map((x) => SubDistrict.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "query": query.toMap(),
        "status": status.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Query {
  final String city;

  Query({
    required this.city,
  });

  factory Query.fromJson(String str) => Query.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Query.fromMap(Map<String, dynamic> json) => Query(
        city: json["city"],
      );

  Map<String, dynamic> toMap() => {
        "city": city,
      };
}

class SubDistrict {
  final String subdistrictId;
  final String provinceId;
  final String province;
  final String cityId;
  final String city;
  final String type;
  final String subdistrictName;

  SubDistrict({
    required this.subdistrictId,
    required this.provinceId,
    required this.province,
    required this.cityId,
    required this.city,
    required this.type,
    required this.subdistrictName,
  });

  factory SubDistrict.fromJson(String str) =>
      SubDistrict.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubDistrict.fromMap(Map<String, dynamic> json) => SubDistrict(
        subdistrictId: json["subdistrict_id"],
        provinceId: json["province_id"],
        province: json["province"],
        cityId: json["city_id"],
        city: json["city"],
        type: json["type"],
        subdistrictName: json["subdistrict_name"],
      );

  Map<String, dynamic> toMap() => {
        "subdistrict_id": subdistrictId,
        "province_id": provinceId,
        "province": province,
        "city_id": cityId,
        "city": city,
        "type": type,
        "subdistrict_name": subdistrictName,
      };

  @override
  String toString() {
    return subdistrictName;
  }
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
