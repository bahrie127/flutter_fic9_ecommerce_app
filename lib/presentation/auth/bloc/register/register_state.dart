part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(AuthResponseModel data) = _Success;
  const factory RegisterState.error(String message) = _Error;
}
