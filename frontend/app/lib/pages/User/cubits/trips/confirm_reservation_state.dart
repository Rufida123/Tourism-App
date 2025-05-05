import 'package:flutter/foundation.dart';

@immutable
abstract class TripReservationState {}

class TripReservationInitial extends TripReservationState {}

class TripReservationLoading extends TripReservationState {}

class TripReservationSuccess extends TripReservationState {}

class TripReservationFailure extends TripReservationState {
  final String errorMessage;
  TripReservationFailure(this.errorMessage);
}
