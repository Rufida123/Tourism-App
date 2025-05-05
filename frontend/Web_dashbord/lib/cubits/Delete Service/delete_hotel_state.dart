import 'package:flutter/foundation.dart';

@immutable
abstract class DeleteHotelDetailsState {}

class DeleteHotelOutDetailsInitial extends DeleteHotelDetailsState {}

class DeleteHotelOutDetailsLoading extends DeleteHotelDetailsState {}

class DeleteHotelOutDetailsSuccess extends DeleteHotelDetailsState {}

class DeleteHotelOutDetailsFailure extends DeleteHotelDetailsState {
  final String errorMessage;
  DeleteHotelOutDetailsFailure(this.errorMessage);
}
