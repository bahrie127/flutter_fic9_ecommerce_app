part of 'get_cost_bloc.dart';

@freezed
class GetCostEvent with _$GetCostEvent {
  const factory GetCostEvent.started() = _Started;
  const factory GetCostEvent.getCost({
    required String origin,
    required String destination,
    required String courier,
  }) = _GetCost;
}