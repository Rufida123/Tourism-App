import 'package:flutter/material.dart';

@immutable
abstract class LoginUserState {}

class LoginUserInitial extends LoginUserState {}

class LoginUserLoading extends LoginUserState {}

class LoginUserSuccess extends LoginUserState {}

class LoginUserFailure extends LoginUserState {
  final String errorMessage;

  LoginUserFailure(this.errorMessage);
}
