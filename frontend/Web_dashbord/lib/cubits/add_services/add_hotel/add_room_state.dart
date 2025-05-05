import 'package:flutter/foundation.dart';

@immutable
abstract class AddRoomState {}

class AddRoomInitial extends AddRoomState {}

class AddRoomLoading extends AddRoomState {}

class AddRoomSuccess extends AddRoomState {}

class AddRoomFailure extends AddRoomState {
  final String errorMessage;
  AddRoomFailure(this.errorMessage);
}

class AddRoomTypeInitial extends AddRoomState {}

class AddRoomTypeLoading extends AddRoomState {}

class AddRoomTypeSuccess extends AddRoomState {}

class AddRoomTypeFailure extends AddRoomState {
  final String errorMessage;
  AddRoomTypeFailure(this.errorMessage);
}

class AddRoomFeaturesInitial extends AddRoomState {}

class AddRoomFeaturesLoading extends AddRoomState {}

class AddRoomFeaturesSuccess extends AddRoomState {}

class AddRoomFeaturesFailure extends AddRoomState {
  final String errorMessage;
  AddRoomFeaturesFailure(this.errorMessage);
}
