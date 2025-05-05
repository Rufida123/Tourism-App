import 'package:flutter/cupertino.dart';

@immutable
abstract class HotelSearchFillterState {}

class HotelSearchFillterInitial extends HotelSearchFillterState {}

class HotelSearchFillterLoading extends HotelSearchFillterState {}

class HotelSearchFillterSuccess extends HotelSearchFillterState {}

class HotelSearchFillterFailure extends HotelSearchFillterState {
  final String errorMessage;
  HotelSearchFillterFailure(this.errorMessage);
}
