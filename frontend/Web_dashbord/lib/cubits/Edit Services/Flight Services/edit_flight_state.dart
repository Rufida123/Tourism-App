import 'package:flutter/foundation.dart';

@immutable
abstract class EditFlightState {}

class EditFlightInitial extends EditFlightState {}

class EditFlightLoading extends EditFlightState {}

class EditFlightSuccess extends EditFlightState {}

class EditFlightFailure extends EditFlightState {
  final String errorMessage;
  EditFlightFailure(this.errorMessage);
}
