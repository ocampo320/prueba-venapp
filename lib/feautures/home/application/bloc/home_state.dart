import 'package:kncha_app/core/failures/common_failure.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
@freezed
abstract class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.data({required List<Court> news}) = _Data;

  const factory HomeState.save({required bool save}) = _Save;

  const factory HomeState.error({
    required CommonFailure failure,
  }) = _Error;
}