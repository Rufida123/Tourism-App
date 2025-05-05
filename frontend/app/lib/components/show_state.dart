import 'package:flutter/material.dart';

@immutable
abstract class FlightListState {}

class FlightListInitial extends FlightListState {}

class FlightListLoading extends FlightListState {}

class FlightListSuccess extends FlightListState {}

class FlightListFailure extends FlightListState {
  final String errorMessage;

  FlightListFailure(this.errorMessage);
}

class FlightAddToFavoriteInitial extends FlightListState {}

class FlightAddToFavoriteLoading extends FlightListState {}

class FlightAddToFavoriteSuccess extends FlightListState {}

class FlightAddToFavoriteFailure extends FlightListState {
  final String errorMessage;

  FlightAddToFavoriteFailure(this.errorMessage);
}

class FlightFavoriteInitial extends FlightListState {}

class FlightFavoriteLoading extends FlightListState {}

class FlightFavoriteSuccess extends FlightListState {}

class FlightFavoriteFailure extends FlightListState {
  final String errorMessage;

  FlightFavoriteFailure(this.errorMessage);
}

class FlightRemoveFromFavoriteInitial extends FlightListState {}

class FlightRemoveFromFavoriteLoading extends FlightListState {}

class FlightRemoveFromFavoriteSuccess extends FlightListState {}

class FlightRemoveFromFavoriteFailure extends FlightListState {
  final String errorMessage;

 FlightRemoveFromFavoriteFailure(this.errorMessage);
}
class FlightCheckFavoriteInitial extends FlightListState {}

class FlightCheckFavoriteLoading extends FlightListState {}

class FlightCheckFavoriteSuccess extends FlightListState {}

class FlightCheckFavoriteFailure extends FlightListState {
  final String errorMessage;

 FlightCheckFavoriteFailure(this.errorMessage);
}

