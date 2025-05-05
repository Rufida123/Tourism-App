import 'package:flutter/foundation.dart';

@immutable
abstract class HotelReservationState {}

class HotelReservationInitial extends HotelReservationState {}

class HotelReservationLoading extends HotelReservationState {}

class HotelReservationSuccess extends HotelReservationState {}

class HotelReservationFailure extends HotelReservationState {
  final String errorMessage;
  HotelReservationFailure(this.errorMessage);
}
