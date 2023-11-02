part of 'order_detail_bloc.dart';

@freezed
class OrderDetailState with _$OrderDetailState {
  const factory OrderDetailState.initial() = _Initial;
  const factory OrderDetailState.loading() = _Loading;
  const factory OrderDetailState.success(OrderDetailResponseModel response) = _Success;
  const factory OrderDetailState.error(String message) = _Error;
}
