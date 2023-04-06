import 'package:flutter/material.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_bloc.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_event.dart';
import 'package:kncha_app/feautures/home/application/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          save: (b)=>const SizedBox(),
            initial: () => const SizedBox(child: Center(child: Text('data'))),
            loading: () => const CircularProgressIndicator(),
            data: (data) => Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
              child: Column(
                    children: data
                        .map(
                          (e) => Center(
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const Icon(Icons.album),
                                    title: Text(e.court ?? ''),
                                    subtitle: Column(
                                      children: [
                                        Text(e.user ?? ''),
                                        Text(e.date ?? ''),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('BUY TICKETS'),
                                        onPressed: () {/* ... */},
                                      ),
                                      const SizedBox(width: 8),
                                      TextButton(
                                        child: const Text('LISTEN'),
                                        onPressed: () {/* ... */},
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
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
