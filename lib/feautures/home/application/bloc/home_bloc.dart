import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kncha_app/core/data/court_store.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';

import 'package:kncha_app/feautures/home/application/bloc/home_state.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CourtStore courtStore;

  HomeBloc({required this.courtStore}) : super(const HomeState.initial()) {
    on<HomeStarted>(getData);
    on<SaveCourtStarted>(saveData);
    on<DeleteStarted>(deleteData);
  }
  Court court = Court();

  FutureOr<void> getData(HomeStarted event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    final state = await courtStore.findAll();
    emit(
      state.fold(
        (error) => HomeState.error(failure: error),
        (data) => HomeState.data(news: data),
      ),
    );
  }

  FutureOr<void> saveData(
      SaveCourtStarted event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    final stateSave = await courtStore.save(event.court);

    if (stateSave.isRight()) {
      final state = await courtStore.findAll();
      emit(
        state.fold(
          (error) => HomeState.error(failure: error),
          (data) => HomeState.data(news: data),
        ),
      );
    }
  }

  FutureOr<void> deleteData(
      DeleteStarted event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    final stateDelete = await courtStore.delete(event.court);

    if (stateDelete.isRight()) {
      final state = await courtStore.findAll();
      emit(
        state.fold(
          (error) => HomeState.error(failure: error),
          (data) => HomeState.data(news: data),
        ),
      );
    }
  }
}
