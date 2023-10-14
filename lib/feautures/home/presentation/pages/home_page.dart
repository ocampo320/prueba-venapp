import 'package:flutter/material.dart';
import 'package:kncha_app/core/color_manager.dart';
import 'package:kncha_app/core/data/court_store.dart';
import 'package:kncha_app/core/utils/app_typography.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';
import 'package:kncha_app/feautures/home/presentation/pages/save_page.dart';
import 'package:kncha_app/feautures/home/presentation/widgets/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(
          HomeStarted(),
        );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SavePage()),
        ),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: 
        ColorManager.neutral600,
        title: Text(
          'Agenda de canchas',
          style: AppTypography.stRaleway(
            color: ColorManager.neutralWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
          child: Scaffold(
        backgroundColor: ColorManager.neutral600,
        body: const SingleChildScrollView(
          child: CardWidget(),
        ),
      )),
    );
  }
}
