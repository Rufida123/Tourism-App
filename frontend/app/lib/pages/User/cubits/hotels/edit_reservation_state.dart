import 'package:flutter/cupertino.dart';

@immutable
abstract class HotelEditReservationState {}

class HotelEditReservationInitial extends HotelEditReservationState {}

class HotelEditReservationLoading extends HotelEditReservationState {}

class HotelEditReservationSuccess extends HotelEditReservationState {}

class HotelEditReservationFailure extends HotelEditReservationState {
  final String errorMessage;
  HotelEditReservationFailure(this.errorMessage);
}
