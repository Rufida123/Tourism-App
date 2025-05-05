import 'package:flutter/foundation.dart';

@immutable
abstract class LogOutState {}

class LogOutInitial extends LogOutState {}

class LogOutLoading extends LogOutState {}

class LogOutSuccess extends LogOutState {}

class LogOutFailure extends LogOutState {
  final String errorMessage;
  LogOutFailure(this.errorMessage);
}
