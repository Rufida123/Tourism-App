import 'package:flutter/foundation.dart';

@immutable
abstract class DeleteFlightDetailsState {}

class DeleteFlightOutDetailsInitial extends DeleteFlightDetailsState {}

class DeleteFlightOutDetailsLoading extends DeleteFlightDetailsState {}

class DeleteFlightOutDetailsSuccess extends DeleteFlightDetailsState {}

class DeleteFlightOutDetailsFailure extends DeleteFlightDetailsState {
  final String errorMessage;
  DeleteFlightOutDetailsFailure(this.errorMessage);
}
