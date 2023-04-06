import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kncha_app/core/data/court_store.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/save_bloc/save_event.dart';

import 'package:kncha_app/feautures/home/application/bloc/save_bloc/save_state.dart';

import 'package:kncha_app/feautures/home/domain/models/court.dart';


class SaveBloc extends Bloc<SaveEvent, SaveState> {
    final CourtStore courtStore;
  SaveBloc({required this.courtStore}) : super(const SaveState.initial()) {
    on<SaveStarted>(saveData);
    

   
  }
   Court court=Court();


  FutureOr<void> saveData(SaveStarted event, Emitter<SaveState> emit) async {
    emit(const SaveState.loading());

    final state = await courtStore.save(event.court);

    emit(
      state.fold(
        (error) => SaveState.error(failure: error),
        (data) => SaveState.data(data: data),
      ),
    );
  }


  
}
