import 'package:flutter/cupertino.dart';

@immutable
abstract class RoomDetailsState {}

class RoomDetailsInitial extends RoomDetailsState {}

class RoomDetailsLoading extends RoomDetailsState {}

class RoomDetailsSuccess extends RoomDetailsState {}

class RoomDetailsFailure extends RoomDetailsState {
  final String errorMessage;

  RoomDetailsFailure(this.errorMessage);
}
