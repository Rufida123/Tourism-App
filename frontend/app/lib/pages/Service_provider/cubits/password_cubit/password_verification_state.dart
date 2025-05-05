import 'package:flutter/material.dart';

@immutable
sealed class ProviderPassVerifiState {}

final class ProviderPassVerifiInitial extends ProviderPassVerifiState {}

final class ProviderPassVerifiLoading extends ProviderPassVerifiState {}

final class ProviderPassVerifiSuccess extends ProviderPassVerifiState {}

final class ProviderPassVerifiFailure extends ProviderPassVerifiState {
  final String message;

  ProviderPassVerifiFailure(this.message);
}
