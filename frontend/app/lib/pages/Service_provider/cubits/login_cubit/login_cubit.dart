import 'dart:io';

import 'package:app/data/web_service/service_provider/login_web.dart';
import 'package:app/pages/Service_provider/cubits/login_cubit/login_state.dart';
import 'package:bloc/bloc.dart';

class LoginProviderCubit extends Cubit<LoginProviderState> {
  final LoginProviderWeb loginProviderWeb;

  LoginProviderCubit(this.loginProviderWeb) : super(LoginProviderInitial());

  Future<void> cubitProviderLogin(String email, String password) async {
    emit(LoginProviderLoading());
    try {
      await loginProviderWeb.loginProvider(email, password);
      emit(LoginProviderSuccess());
    } on WrongPasswordOrNotVerifiedException {
      emit(LoginProviderFailure(
          'The password is wrong or the email is not verified.'));
    } on InvalidEmailException {
      emit(LoginProviderFailure('The selected email is invalid.'));
    } on SocketException {
      emit(LoginProviderFailure('No internet connection.'));
    } on Exception catch (e) {
      emit(LoginProviderFailure(e.toString()));
    }
  }
}
