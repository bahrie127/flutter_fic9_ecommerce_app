import 'package:dartz/dartz.dart';
import 'package:flutter_fic9_ecommerce_app/common/constants/variables.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/city_response_model.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/province_response_model.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/subdistrict_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/responses/cost_response_model.dart';

class RajaOngkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/province');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  Future<Either<String, CityResponseModel>> getCities(String provinceId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(CityResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  Future<Either<String, SubDistrictResponseModel>> getSubDistrict(
      String cityId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/subdistrict?city=$cityId');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(SubDistrictResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  Future<Either<String, CostResponseModel>> getCost(
    String origin,
    String destination,
    String courier,
  ) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/cost');
    final response = await http.post(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
        'content-type': 'application/x-www-form-urlencoded',
      },
      body: {
        'origin': origin,
        'originType': 'subdistrict',
        'destination': destination,
        'destinationType': 'subdistrict',
        'weight': '500',
        'courier': courier,
      },
    );
    if (response.statusCode == 200) {
      return right(CostResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }
}
