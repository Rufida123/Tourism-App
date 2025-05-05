import 'package:flutter/foundation.dart';

@immutable
abstract class EditRoomState {}

class EditRoomInitial extends EditRoomState {}

class EditRoomLoading extends EditRoomState {}

class EditRoomSuccess extends EditRoomState {}

class EditRoomFailure extends EditRoomState {
  final String errorMessage;
  EditRoomFailure(this.errorMessage);
}

class EditRoomTypeInitial extends EditRoomState {}

class EditRoomTypeLoading extends EditRoomState {}

class EditRoomTypeSuccess extends EditRoomState {}

class EditRoomTypeFailure extends EditRoomState {
  final String errorMessage;
  EditRoomTypeFailure(this.errorMessage);
}

class EditRoomFeaturesInitial extends EditRoomState {}

class EditRoomFeaturesLoading extends EditRoomState {}

class EditRoomFeaturesSuccess extends EditRoomState {}

class EditRoomFeaturesFailure extends EditRoomState {
  final String errorMessage;
  EditRoomFeaturesFailure(this.errorMessage);
}
