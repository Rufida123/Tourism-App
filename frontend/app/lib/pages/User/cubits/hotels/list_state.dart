import 'package:flutter/material.dart';

@immutable
abstract class HotelListState {}

class HotelListInitial extends HotelListState {}

class HotelListLoading extends HotelListState {}

class HotelListSuccess extends HotelListState {}

class HotelListFailure extends HotelListState {
  final String errorMessage;

  HotelListFailure(this.errorMessage);
}

class HotelAddToFavoriteInitial extends HotelListState {}

class HotelAddToFavoriteLoading extends HotelListState {}

class HotelAddToFavoriteSuccess extends HotelListState {}

class HotelAddToFavoriteFailure extends HotelListState {
  final String errorMessage;

  HotelAddToFavoriteFailure(this.errorMessage);
}

class HotelFavoriteInitial extends HotelListState {}

class HotelFavoriteLoading extends HotelListState {}

class HotelFavoriteSuccess extends HotelListState {}

class HotelFavoriteFailure extends HotelListState {
  final String errorMessage;

  HotelFavoriteFailure(this.errorMessage);
}

class HotelRemoveFromFavoriteInitial extends HotelListState {}

class HotelRemoveFromFavoriteLoading extends HotelListState {}

class HotelRemoveFromFavoriteSuccess extends HotelListState {}

class HotelRemoveFromFavoriteFailure extends HotelListState {
  final String errorMessage;

  HotelRemoveFromFavoriteFailure(this.errorMessage);
}
