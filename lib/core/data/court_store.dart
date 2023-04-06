import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kncha_app/core/data/local_data_base.dart';
import 'package:kncha_app/core/failures/common_failure.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:sembast/sembast.dart';
import 'package:dartz/dartz.dart';

class CourtStore {
   static const String _STORE_NAME = "book_data";

   final _store = intMapStoreFactory.store(_STORE_NAME);

   Future<Database> get _db async =>
      await LocalDatabase.instance.database;

   Future<Either<CommonFailure, bool>> save(Court entity) async {
    try {
      await _store.add(await _db, entity.toJson());
      debugPrint(
          "--------Guardado en la BD local---------- ${entity.toJson()}");
      return right(true);
    } catch (e) {
      return left(CommonFailure.data(message: e.toString()));
    }
  }

  deleteAll(Court entity) async {
    await _store.delete(
      await _db,
    );
  }

   Future<Either<CommonFailure, List<Court>>> findAll() async {
    try {
      final snapshot = await _store.find(await _db);
      debugPrint(
          "--------Consulta en la BD local----------" + snapshot.toString());
      return right(snapshot.map((e) => Court.fromJson(e.value)).toList());
    } catch (e) {
      return left(CommonFailure.data(message: e.toString()));
    }
  }

  Future<bool> delete(Court entity) async {
    debugPrint("DELETING $entity");
    final finder = Finder(filter: Filter.equals('user', entity.user));
    await _store.delete(await _db, finder: finder);
    await findAll();
    return true;
  }
}
