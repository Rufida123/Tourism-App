import 'package:flutter/cupertino.dart';

@immutable
abstract class HotelRatingState {}

class HotelRatingInitial extends HotelRatingState {}

class HotelRatingLoading extends HotelRatingState {}

class HotelRatingSuccess extends HotelRatingState {}

class HotelRatingFailure extends HotelRatingState {
  final String errorMessage;

  HotelRatingFailure(this.errorMessage);
}
