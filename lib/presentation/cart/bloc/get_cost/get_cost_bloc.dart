import 'package:bloc/bloc.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/cost_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/rajaongkir_remote_datasource.dart';

part 'get_cost_event.dart';
part 'get_cost_state.dart';
part 'get_cost_bloc.freezed.dart';

class GetCostBloc extends Bloc<GetCostEvent, GetCostState> {
  GetCostBloc() : super(const _Initial()) {
    on<_GetCost>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getCost(
        event.origin,
        event.destination,
        event.courier,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
