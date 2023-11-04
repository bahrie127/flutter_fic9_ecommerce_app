part of 'get_cost_bloc.dart';

@freezed
class GetCostState with _$GetCostState {
  const factory GetCostState.initial() = _Initial;
  const factory GetCostState.loading() = _Loading;
  const factory GetCostState.loaded(CostResponseModel data) = _Loaded;
  const factory GetCostState.error(String message) = _Error;
}
