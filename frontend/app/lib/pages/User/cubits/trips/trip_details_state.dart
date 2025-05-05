import 'package:flutter/cupertino.dart';

@immutable
abstract class TripDetailsState {}

class TripDetailsInitial extends TripDetailsState {}

class TripDetailsLoading extends TripDetailsState {}

class TripDetailsSuccess extends TripDetailsState {}

class TripDetailsFailure extends TripDetailsState {
  final String errorMessage;

  TripDetailsFailure(this.errorMessage);
}
