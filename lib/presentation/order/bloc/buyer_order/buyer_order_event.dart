part of 'buyer_order_bloc.dart';

@freezed
class BuyerOrderEvent with _$BuyerOrderEvent {
  const factory BuyerOrderEvent.started() = _Started;
  const factory BuyerOrderEvent.getBuyerOrder() = _GetBuyerOrder;
}