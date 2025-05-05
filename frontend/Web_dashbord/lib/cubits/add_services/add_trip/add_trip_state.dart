import 'package:flutter/foundation.dart';

@immutable
abstract class AddTripDetailsState {}

class AddTripOutDetailsInitial extends AddTripDetailsState {}

class AddTripOutDetailsLoading extends AddTripDetailsState {}

class AddTripOutDetailsSuccess extends AddTripDetailsState {}

class AddTripOutDetailsFailure extends AddTripDetailsState {
  final String errorMessage;
  AddTripOutDetailsFailure(this.errorMessage);
}

class AddTripInDetailsInitial extends AddTripDetailsState {}

class AddTripInDetailsLoading extends AddTripDetailsState {}

class AddTripInDetailsSuccess extends AddTripDetailsState {}

class AddTripInDetailsFailure extends AddTripDetailsState {
  final String errorMessage;
  AddTripInDetailsFailure(this.errorMessage);
}

class AddTripActivityDetailsInitial extends AddTripDetailsState {}

class AddTripActivityDetailsLoading extends AddTripDetailsState {}

class AddTripActivityDetailsSuccess extends AddTripDetailsState {}

class AddTripActivityDetailsFailure extends AddTripDetailsState {
  final String errorMessage;
  AddTripActivityDetailsFailure(this.errorMessage);
}
