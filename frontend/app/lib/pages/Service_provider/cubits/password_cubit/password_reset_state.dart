import 'package:flutter/material.dart';

@immutable
sealed class ProviderPassResetState {}

final class ProviderPassResetInitial extends ProviderPassResetState {}

final class ProviderPassResetLoading extends ProviderPassResetState {}

final class ProviderPassResetSuccess extends ProviderPassResetState {}

final class ProviderPassResetFailure extends ProviderPassResetState {
  final String message;

  ProviderPassResetFailure(this.message);
}
