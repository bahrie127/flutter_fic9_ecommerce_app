part of 'order_detail_bloc.dart';

@freezed
class OrderDetailEvent with _$OrderDetailEvent {
  const factory OrderDetailEvent.started() = _Started;
  const factory OrderDetailEvent.getOrderDetail(String orderId) = _GetOrderDetail;
}