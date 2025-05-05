import 'package:flutter/foundation.dart';

@immutable
abstract class StatusState {}

class StatusInitial extends StatusState {}

class StatusLoading extends StatusState {}

class StatusSuccess extends StatusState {}

class StatusFailure extends StatusState {
  final String errorMessage;
  StatusFailure(this.errorMessage);
}
