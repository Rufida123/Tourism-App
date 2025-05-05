import 'package:flutter/cupertino.dart';

@immutable
abstract class TripEditReservationState {}

class TripEditReservationInitial extends TripEditReservationState {}

class TripEditReservationLoading extends TripEditReservationState {}

class TripEditReservationSuccess extends TripEditReservationState {}

class TripEditReservationFailure extends TripEditReservationState {
  final String errorMessage;
  TripEditReservationFailure(this.errorMessage);
}
