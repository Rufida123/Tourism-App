part of 'flight_offer_cubit.dart';

@immutable
abstract class FlightOfferState {}

class FlightOfferInitial extends FlightOfferState {}

class FlightOfferLoading extends FlightOfferState {}

class FlightOfferSuccess extends FlightOfferState {}

class FlightOfferFailure extends FlightOfferState {
  final String errorMessage;

  FlightOfferFailure(this.errorMessage);
}
