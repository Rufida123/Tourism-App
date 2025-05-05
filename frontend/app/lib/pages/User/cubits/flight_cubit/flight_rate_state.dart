part of 'flight_rate_cubit.dart';

@immutable
abstract class FlightRatingState {}

class FlightRatingInitial extends FlightRatingState {}

class FlightRatingLoading extends FlightRatingState {}

class FlightRatingSuccess extends FlightRatingState {}

class FlightRatingFailure extends FlightRatingState {
  final String errorMessage;

  FlightRatingFailure(this.errorMessage);
}