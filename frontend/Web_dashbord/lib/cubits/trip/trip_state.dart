part of 'trip_cubit.dart';

@immutable
abstract class TripListState {}

class TripListInitial extends TripListState {}

class TripListLoading extends TripListState {}

class TripListSuccess extends TripListState {}

class TripListFailure extends TripListState {
  final String errorMessage;
  TripListFailure(this.errorMessage);
}
