import 'package:bloc/bloc.dart';
import 'package:flutter_fic9_ecommerce_app/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/city_response_model.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(const _Initial()) {
    on<_GetAllByProvinceId>((event, emit) async {
      emit(const _Loading());
      final response =
          await RajaOngkirRemoteDatasource().getCities(event.province);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir.results)),
      );
    });
  }
}
