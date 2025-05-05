import 'package:flutter/material.dart';

@immutable
abstract class TripReservationPageState {}

class TripReservationPageInitial extends TripReservationPageState {}

class TripReservationPageLoading extends TripReservationPageState {}

class TripReservationPageSuccess extends TripReservationPageState {}

class TripReservationPageFailure extends TripReservationPageState {
  final String errorMessage;

  TripReservationPageFailure(this.errorMessage);
}

@immutable
abstract class TripCancelReservationState {}

class TripCancelReservationInitial extends TripReservationPageState {}

class TripCancelReservationLoading extends TripReservationPageState {}

class TripCancelReservationSuccess extends TripReservationPageState {}

class TripCancelReservationFailure extends TripReservationPageState {
  final String errorMessage;

  TripCancelReservationFailure(this.errorMessage);
}
