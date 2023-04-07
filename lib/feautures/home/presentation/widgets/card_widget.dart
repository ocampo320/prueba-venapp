import 'package:flutter/material.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, this.nameCourt, this.date, this.userName});
  final String? nameCourt;
  final String? date;
  final String? userName;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeStarted());
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeStarted());
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.when(
            save: (b) => const SizedBox(),
            initial: () => const SizedBox(child: Center(child: Text('data'))),
            loading: () => const CircularProgressIndicator(),
            data: (data) => Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  child: Column(
                    children: data
                        .map(
                          (e) => Center(
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Icon(
                                        Icons.check_circle_outline,
                                        size: 40,
                                      ),
                                    ),
                                    subtitle: Center(
                                      child: Column(
                                        children: [
                                          Text(e.user ?? ''),
                                          Text(e.court ?? ''),
                                          Text(e.date ?? ''),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, right: 10),
                                          child: ElevatedButton(
                                            child: const Text(
                                                'Borrar el agendamiento'),
                                            onPressed: ()=>showAlertDialog(context,e),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            error: (error) {
              return Text(error.message);
            });
      },
    );
  }
}

showAlertDialog(BuildContext context, Court e) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      context.read<HomeBloc>().add(
            DeleteStarted(e),
          );
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alerta"),
    content: Text("Esta seguro de  borrar el agendamiento."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
