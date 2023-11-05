part of 'buyer_order_bloc.dart';

@freezed
class BuyerOrderState with _$BuyerOrderState {
  const factory BuyerOrderState.initial() = _Initial;
  const factory BuyerOrderState.loading() = _Loading;
  const factory BuyerOrderState.loaded(List<BuyerOrder> orders) = _Loaded;
  const factory BuyerOrderState.error(String message) = _Error;
}
