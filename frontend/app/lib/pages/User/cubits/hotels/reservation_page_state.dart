import 'package:flutter/material.dart';

@immutable
abstract class HotelReservationPageState {}

class HotelReservationPageInitial extends HotelReservationPageState {}

class HotelReservationPageLoading extends HotelReservationPageState {}

class HotelReservationPageSuccess extends HotelReservationPageState {}

class HotelReservationPageFailure extends HotelReservationPageState {
  final String errorMessage;

  HotelReservationPageFailure(this.errorMessage);
}

@immutable
abstract class HotelCancelReservationState {}

class HotelCancelReservationInitial extends HotelReservationPageState {}

class HotelCancelReservationLoading extends HotelReservationPageState {}

class HotelCancelReservationSuccess extends HotelReservationPageState {}

class HotelCancelReservationFailure extends HotelReservationPageState {
  final String errorMessage;

  HotelCancelReservationFailure(this.errorMessage);
}
