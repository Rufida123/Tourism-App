part of 'flight_details_cubit.dart';

@immutable
abstract class FlightDetailsState {}

 class FlightDetailsInitial extends FlightDetailsState {}
  class FlightDetailsLoading extends FlightDetailsState {}
   class FlightDetailsSuccess extends FlightDetailsState {}
    class FlightDetailsFailure extends FlightDetailsState {
      final String errorMessage;

  FlightDetailsFailure(this.errorMessage);
    }
