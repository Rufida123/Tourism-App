import 'package:flutter/cupertino.dart';

@immutable
abstract class TripRatingState {}

class TripRatingInitial extends TripRatingState {}

class TripRatingLoading extends TripRatingState {}

class TripRatingSuccess extends TripRatingState {}

class TripRatingFailure extends TripRatingState {
  final String errorMessage;

  TripRatingFailure(this.errorMessage);
}
