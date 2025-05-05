import 'package:flutter/material.dart';

@immutable
abstract class SearchFlightState {}

class SearchFlightInitial extends SearchFlightState {}

class SearchFlightLoading extends SearchFlightState {}

class SearchFlightSuccess extends SearchFlightState {
}

class SearchFlightFailure extends SearchFlightState {
  final String errorMessage;

  SearchFlightFailure(this.errorMessage);
}