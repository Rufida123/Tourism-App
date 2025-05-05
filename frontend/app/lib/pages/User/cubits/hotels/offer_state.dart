import 'package:flutter/cupertino.dart';

@immutable
abstract class HotelOfferState {}

class HotelOfferInitial extends HotelOfferState {}

class HotelOfferLoading extends HotelOfferState {}

class HotelOfferSuccess extends HotelOfferState {}

class HotelOfferFailure extends HotelOfferState {
  final String errorMessage;

  HotelOfferFailure(this.errorMessage);
}
