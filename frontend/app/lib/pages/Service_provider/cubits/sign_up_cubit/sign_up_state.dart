import 'package:flutter/foundation.dart';

@immutable
abstract class SignUpProviderState {}

final class SignUpProviderInitial extends SignUpProviderState {}

final class SignUpProviderSuccess extends SignUpProviderState {}

final class SignUpProviderLoading extends SignUpProviderState {}

final class SignUpProviderFailure extends SignUpProviderState {
  final String errorMessage;

  SignUpProviderFailure(this.errorMessage);
}
