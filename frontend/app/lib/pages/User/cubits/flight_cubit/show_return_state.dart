part of 'show_return_cubit.dart';

@immutable
abstract class FlightReturnListState {}

class FlightReturnListInitial extends FlightReturnListState {}

class FlightReturnListLoading extends FlightReturnListState {}

class FlightReturnListSuccess extends FlightReturnListState {}

class FlightReturnListFailure extends FlightReturnListState {
  final String errorMessage;

  FlightReturnListFailure(this.errorMessage);
}

class FlightReturnAddToFavoriteInitial extends FlightReturnListState {}

class FlightReturnAddToFavoriteLoading extends FlightReturnListState {}

class FlightReturnAddToFavoriteSuccess extends FlightReturnListState {}

class FlightReturnAddToFavoriteFailure extends FlightReturnListState {
  final String errorMessage;

  FlightReturnAddToFavoriteFailure(this.errorMessage);
}

class FlightReturnFavoriteInitial extends FlightReturnListState {}

class FlightReturnFavoriteLoading extends FlightReturnListState {}

class FlightReturnFavoriteSuccess extends FlightReturnListState {}

class FlightReturnFavoriteFailure extends FlightReturnListState {
  final String errorMessage;

  FlightReturnFavoriteFailure(this.errorMessage);
}

class FlightReturnRemoveFromFavoriteInitial extends FlightReturnListState {}

class FlightReturnRemoveFromFavoriteLoading extends FlightReturnListState {}

class FlightReturnRemoveFromFavoriteSuccess extends FlightReturnListState {}

class FlightReturnRemoveFromFavoriteFailure extends FlightReturnListState {
  final String errorMessage;

 FlightReturnRemoveFromFavoriteFailure(this.errorMessage);
}
class FlightCheckReturnFavoriteInitial extends FlightReturnListState {}

class FlightCheckReturnFavoriteLoading extends FlightReturnListState {}

class FlightCheckReturnFavoriteSuccess extends FlightReturnListState {}

class FlightCheckReturnFavoriteFailure extends FlightReturnListState {
  final String errorMessage;

 FlightCheckReturnFavoriteFailure(this.errorMessage);
}

