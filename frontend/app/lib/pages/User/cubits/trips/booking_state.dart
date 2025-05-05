import 'package:flutter/foundation.dart';

@immutable
abstract class TripBookingState {}

class TripBookingInitial extends TripBookingState {}

class TripBookingLoading extends TripBookingState {}

class TripBookingSuccess extends TripBookingState {}

class TripBookingFailure extends TripBookingState {
  final String errorMessage;
  TripBookingFailure(this.errorMessage);
}
