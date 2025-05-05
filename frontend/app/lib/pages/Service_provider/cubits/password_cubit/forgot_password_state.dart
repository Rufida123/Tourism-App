part of 'forgot_password_cubit.dart';

@immutable
sealed class ProviderForgotPasswordState {}

final class ProviderForgotPasswordInitial extends ProviderForgotPasswordState {}

final class ProviderForgotPasswordLoading extends ProviderForgotPasswordState {}

final class ProviderForgotPasswordSuccess extends ProviderForgotPasswordState {}

final class ProviderForgotPasswordFailure extends ProviderForgotPasswordState {
  final String message;

  ProviderForgotPasswordFailure(this.message);
}
