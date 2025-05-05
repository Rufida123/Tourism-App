import 'package:flutter/material.dart';

@immutable
abstract class FlightReservationPageState {}

class FlightReservationPageInitial extends FlightReservationPageState {}

class FlightReservationPageLoading extends FlightReservationPageState {}

class FlightReservationPageSuccess extends FlightReservationPageState {}

class FlightReservationPageFailure extends FlightReservationPageState {
  final String errorMessage;

  FlightReservationPageFailure(this.errorMessage);
}

@immutable
abstract class HotelCancelReservationState {}

class FlightCancelReservationInitial extends FlightReservationPageState {}

class FlightCancelReservationLoading extends FlightReservationPageState {}

class FlightCancelReservationSuccess extends FlightReservationPageState {}

class FlightCancelReservationFailure extends FlightReservationPageState {
  final String errorMessage;

  FlightCancelReservationFailure(this.errorMessage);
}
