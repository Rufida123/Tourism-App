import 'package:flutter/material.dart';

@immutable
sealed class UserPassResetState {}

final class UserPassResetInitial extends UserPassResetState {}

final class UserPassResetLoading extends UserPassResetState {}

final class UserPassResetSuccess extends UserPassResetState {}

final class UserPassResetFailure extends UserPassResetState {
  final String message;

  UserPassResetFailure(this.message);
}
