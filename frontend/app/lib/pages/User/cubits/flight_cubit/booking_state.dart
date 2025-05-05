part of 'booking_cubit.dart';

@immutable
abstract class BookingFlightState {}

 class BookingFlightInitial extends BookingFlightState {}
  class BookingFlightLoading extends BookingFlightState {}
   class BookingFlightSuccess extends BookingFlightState {}
    class BookingFlightFailure extends BookingFlightState {
       final String errorMessage;

  BookingFlightFailure(this.errorMessage);
    }
