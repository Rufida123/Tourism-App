import 'package:flutter/foundation.dart';

@immutable
abstract class EditHotelState {}

class EditHotelInitial extends EditHotelState {}

class EditHotelLoading extends EditHotelState {}

class EditHotelSuccess extends EditHotelState {}

class EditHotelFailure extends EditHotelState {
  final String errorMessage;
  EditHotelFailure(this.errorMessage);
}
