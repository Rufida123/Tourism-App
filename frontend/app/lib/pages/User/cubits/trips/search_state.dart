import 'package:flutter/cupertino.dart';

@immutable
abstract class TripSearchFillterState {}

class TripSearchFillterInitial extends TripSearchFillterState {}

class TripSearchFillterLoading extends TripSearchFillterState {}

class TripSearchFillterSuccess extends TripSearchFillterState {}

class TripSearchFillterFailure extends TripSearchFillterState {
  final String errorMessage;
  TripSearchFillterFailure(this.errorMessage);
}
