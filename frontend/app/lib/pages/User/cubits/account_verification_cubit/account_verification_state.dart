import 'package:flutter/material.dart';

@immutable
abstract class UserAccVerificationState {}

final class UserAccVerifiInitial extends UserAccVerificationState {}

final class UserAccVerifiLoading extends UserAccVerificationState {}

final class UserAccVerifiSuccess extends UserAccVerificationState {}

final class UserAccVerifiFailure extends UserAccVerificationState {
  final String message;

  UserAccVerifiFailure(this.message);
}
