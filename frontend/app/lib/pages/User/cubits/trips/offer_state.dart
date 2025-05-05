import 'package:flutter/cupertino.dart';

@immutable
abstract class TripOfferState {}

class TripOfferInitial extends TripOfferState {}

class TripOfferLoading extends TripOfferState {}

class TripOfferSuccess extends TripOfferState {}

class TripOfferFailure extends TripOfferState {
  final String errorMessage;

  TripOfferFailure(this.errorMessage);
}
