import 'package:flutter/foundation.dart';

@immutable
abstract class HotelBookingState {}

class HotelBookingInitial extends HotelBookingState {}

class HotelBookingLoading extends HotelBookingState {}

class HotelBookingSuccess extends HotelBookingState {}

class HotelBookingFailure extends HotelBookingState {
  final String errorMessage;
  HotelBookingFailure(this.errorMessage);
}
