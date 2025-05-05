import 'package:flutter/foundation.dart';

@immutable
abstract class AddHotelState {}

class AddHotelInitial extends AddHotelState {}

class AddHotelLoading extends AddHotelState {}

class AddHotelSuccess extends AddHotelState {}

class AddHotelFailure extends AddHotelState {
  final String errorMessage;
  AddHotelFailure(this.errorMessage);
}
