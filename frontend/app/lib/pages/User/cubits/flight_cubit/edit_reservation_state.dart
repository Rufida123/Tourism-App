import 'package:flutter/cupertino.dart';

@immutable
abstract class FlightEditReservationState {}

class FlightEditReservationInitial extends FlightEditReservationState {}

class FlightEditReservationLoading extends FlightEditReservationState {}

class FlightEditReservationSuccess extends FlightEditReservationState {}

class FlightEditReservationFailure extends FlightEditReservationState {
  final String errorMessage;
  FlightEditReservationFailure(this.errorMessage);
}
