part of 'filter_return_cubit.dart';

@immutable
sealed class FilterReturnFlightState {}

final class FilterReturnFlightInitial extends FilterReturnFlightState {}
final class FilterReturnFlightLoading extends FilterReturnFlightState {}
final class FilterReturnFlightSuccess extends FilterReturnFlightState {}
final class FilterReturnFlightFailure extends FilterReturnFlightState {
  final String errorMessage;

  FilterReturnFlightFailure(this.errorMessage);
}
