import 'package:flutter/material.dart';

@immutable
sealed class UserForgotPasswordState {}

final class UserForgotPasswordInitial extends UserForgotPasswordState {}

final class UserForgotPasswordLoading extends UserForgotPasswordState {}

final class UserForgotPasswordSuccess extends UserForgotPasswordState {}

final class UserForgotPasswordFailure extends UserForgotPasswordState {
  final String message;

  UserForgotPasswordFailure(this.message);
}
