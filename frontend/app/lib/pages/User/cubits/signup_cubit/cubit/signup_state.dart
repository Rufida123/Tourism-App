import 'package:flutter/foundation.dart';

@immutable
abstract class SignUpUserState {}

final class SignUpUserInitial extends SignUpUserState {}

final class SignUpUserSuccess extends SignUpUserState {}

final class SignUpUserLoading extends SignUpUserState {}

final class SignUpUserFailure extends SignUpUserState {
  final String errorMessage;

  SignUpUserFailure(this.errorMessage);
}
