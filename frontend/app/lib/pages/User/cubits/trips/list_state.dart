part of 'list_cubit.dart';

@immutable
abstract class TripListState {}

class TripListInitial extends TripListState {}

class TripListLoading extends TripListState {}

class TripListSuccess extends TripListState {}

class TripListFailure extends TripListState {
  final String errorMessage;

  TripListFailure(this.errorMessage);
}

class TripAddToFavoriteInitial extends TripListState {}

class TripAddToFavoriteLoading extends TripListState {}

class TripAddToFavoriteSuccess extends TripListState {}

class TripAddToFavoriteFailure extends TripListState {
  final String errorMessage;

  TripAddToFavoriteFailure(this.errorMessage);
}

class TripRemoveFromFavoriteInitial extends TripListState {}

class TripRemoveFromFavoriteLoading extends TripListState {}

class TripRemoveFromFavoriteSuccess extends TripListState {}

class TripRemoveFromFavoriteFailure extends TripListState {
  final String errorMessage;

  TripRemoveFromFavoriteFailure(this.errorMessage);
}

class TripFavoriteInitial extends TripListState {}

class TripFavoriteLoading extends TripListState {}

class TripFavoriteSuccess extends TripListState {}

class TripFavoriteFailure extends TripListState {
  final String errorMessage;

  TripFavoriteFailure(this.errorMessage);
}
