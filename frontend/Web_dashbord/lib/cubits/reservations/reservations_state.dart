import 'package:flutter/material.dart';

@immutable
abstract class ReservationsState {}

class ReservationFlightInitial extends ReservationsState {}

class ReservationFlightLoading extends ReservationsState {}

class ReservationFlightSuccess extends ReservationsState {}

class ReservationFlightFailure extends ReservationsState {
  final String errorMessage;
  ReservationFlightFailure(this.errorMessage);
}

class ReservationHotelInitial extends ReservationsState {}

class ReservationHotelLoading extends ReservationsState {}

class ReservationHotelSuccess extends ReservationsState {}

class ReservationHotelFailure extends ReservationsState {
  final String errorMessage;
  ReservationHotelFailure(this.errorMessage);
}

class ReservationTripInitial extends ReservationsState {}

class ReservationTripLoading extends ReservationsState {}

class ReservationTripSuccess extends ReservationsState {}

class ReservationTripFailure extends ReservationsState {
  final String errorMessage;
  ReservationTripFailure(this.errorMessage);
}
