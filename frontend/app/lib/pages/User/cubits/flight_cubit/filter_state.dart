part of 'filter_cubit.dart';

@immutable
abstract class FilterFlightState {}

class FilterFlightInitial extends FilterFlightState {}

class FilterFlightLoading extends FilterFlightState {}

class FilterFlightSuccess extends FilterFlightState {
 
}

class FilterFlightFailure extends FilterFlightState {
  final String errorMessage;

  FilterFlightFailure(this.errorMessage);
}