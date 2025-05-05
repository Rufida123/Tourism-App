part of 'flight_list_cubit.dart';



@immutable
abstract class FlightListState {}

class FlightListInitial extends FlightListState {}

class FlightListLoading extends FlightListState {}

class FlightListSuccess extends FlightListState {}

class FlightListFailure extends FlightListState {
  final String errorMessage;

  FlightListFailure(this.errorMessage);
}