import 'dart:convert';

class CityResponseModel {
  final Rajaongkir rajaongkir;

  CityResponseModel({
    required this.rajaongkir,
  });

  factory CityResponseModel.fromJson(String str) =>
      CityResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CityResponseModel.fromMap(Map<String, dynamic> json) =>
      CityResponseModel(
        rajaongkir: Rajaongkir.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir.toMap(),
      };
}

class Rajaongkir {
  final Query query;
  final Status status;
  final List<City> results;

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
        results: List<City>.from(json["results"].map((x) => City.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "query": query.toMap(),
        "status": status.toMap(),
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

class Query {
  final String province;

  Query({
    required this.province,
  });

  factory Query.fromJson(String str) => Query.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Query.fromMap(Map<String, dynamic> json) => Query(
        province: json["province"],
      );

  Map<String, dynamic> toMap() => {
        "province": province,
      };
}

class City {
  final String cityId;
  final String provinceId;
  final String province;
  final String type;
  final String cityName;
  final String postalCode;

  City({
    required this.cityId,
    required this.provinceId,
    required this.province,
    required this.type,
    required this.cityName,
    required this.postalCode,
  });

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        cityId: json["city_id"],
        provinceId: json["province_id"],
        province: json["province"],
        type: json["type"],
        cityName: json["city_name"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toMap() => {
        "city_id": cityId,
        "province_id": provinceId,
        "province": province,
        "type": type,
        "city_name": cityName,
        "postal_code": postalCode,
      };

  @override
  String toString() {
    return cityName;
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
