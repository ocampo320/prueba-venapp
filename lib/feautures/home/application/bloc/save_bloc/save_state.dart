import 'package:kncha_app/feautures/home/domain/models/court.dart';

import 'package:kncha_app/core/failures/common_failure.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_state.freezed.dart';
@freezed
abstract class SaveState with _$SaveState {
  const SaveState._();
  const factory SaveState.initial() = _Initial;
  
  const factory SaveState.loading() = _Loading;

  const factory SaveState.data({required bool data}) = _Data;

  const factory SaveState.error({
    required CommonFailure failure,
  }) = _Error;
}