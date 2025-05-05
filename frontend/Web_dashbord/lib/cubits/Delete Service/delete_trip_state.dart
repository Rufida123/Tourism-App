import 'package:flutter/foundation.dart';

@immutable
abstract class DeleteTripDetailsState {}

class DeleteTripOutDetailsInitial extends DeleteTripDetailsState {}

class DeleteTripOutDetailsLoading extends DeleteTripDetailsState {}

class DeleteTripOutDetailsSuccess extends DeleteTripDetailsState {}

class DeleteTripOutDetailsFailure extends DeleteTripDetailsState {
  final String errorMessage;
  DeleteTripOutDetailsFailure(this.errorMessage);
}
