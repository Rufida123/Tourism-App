part of 'flight_return_list_cubit.dart';

@immutable
abstract class FlightReturnListState {}

class FlightReturnListInitial extends FlightReturnListState {}

class FlightReturnListLoading extends FlightReturnListState {}

class FlightReturnListSuccess extends FlightReturnListState {}

class FlightReturnListFailure extends FlightReturnListState {
  final String errorMessage;

  FlightReturnListFailure(this.errorMessage);
}
