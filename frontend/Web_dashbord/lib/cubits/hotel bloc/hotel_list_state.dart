part of 'hotel_list_cubit.dart';

@immutable
abstract class HotelListState {}

class HotelListInitial extends HotelListState {}

class HotelListLoading extends HotelListState {}

class HotelListSuccess extends HotelListState {}

class HotelListFailure extends HotelListState {
  final String errorMessage;

  HotelListFailure(this.errorMessage);
}