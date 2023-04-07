import 'package:flutter/material.dart';
import 'package:kncha_app/core/data/court_store.dart';
import 'package:kncha_app/feautures/home/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feautures/home/application/bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CourtStore(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(courtStore: CourtStore()),
          ),
          
        ],
        child: MaterialApp(
          title: 'Library App',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
