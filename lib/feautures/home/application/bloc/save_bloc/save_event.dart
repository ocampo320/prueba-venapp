
import 'package:equatable/equatable.dart';
import 'package:kncha_app/feautures/home/domain/models/court.dart';

abstract class SaveEvent extends Equatable {
   const SaveEvent([List props = const []]) : super();
  
}
class SaveStarted extends SaveEvent {
  final Court court;
  const SaveStarted(this.court);
  @override
  List<Object?> get props => [];
}
