import 'package:flutter/foundation.dart';

@immutable
abstract class FlightReservationState {}

class FlightReservationInitial extends FlightReservationState {}

class FlightReservationLoading extends FlightReservationState {}

class FlightReservationSuccess extends FlightReservationState {}

class FlightReservationFailure extends FlightReservationState {
  final String errorMessage;
  FlightReservationFailure(this.errorMessage);
}
