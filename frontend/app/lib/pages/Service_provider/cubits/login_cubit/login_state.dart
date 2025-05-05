abstract class LoginProviderState {}

class LoginProviderInitial extends LoginProviderState {}

class LoginProviderLoading extends LoginProviderState {}

class LoginProviderSuccess extends LoginProviderState {}

class LoginProviderFailure extends LoginProviderState {
  final String errorMessage;

  LoginProviderFailure(this.errorMessage);
}
