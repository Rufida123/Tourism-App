import 'package:flutter/material.dart';

@immutable
sealed class UserPassVerifiState {}

final class UserPassVerifiInitial extends UserPassVerifiState {}

final class UserPassVerifiLoading extends UserPassVerifiState {}

final class UserPassVerifiSuccess extends UserPassVerifiState {}

final class UserPassVerifiFailure extends UserPassVerifiState {
  final String message;

  UserPassVerifiFailure(this.message);
}
