import 'package:flutter/foundation.dart';

@immutable
abstract class AddFlightState {}

class AddFlightInitial extends AddFlightState {}

class AddFlightLoading extends AddFlightState {}

class AddFlightSuccess extends AddFlightState {}

class AddFlightFailure extends AddFlightState {
  final String errorMessage;
  AddFlightFailure(this.errorMessage);
}
