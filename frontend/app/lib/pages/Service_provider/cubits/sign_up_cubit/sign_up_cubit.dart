import 'dart:io';

import 'package:app/data/web_service/service_provider/signUp_web.dart';
import 'package:app/pages/Service_provider/cubits/sign_up_cubit/sign_up_state.dart';
import 'package:bloc/bloc.dart';

class SignUpProviderCubit extends Cubit<SignUpProviderState> {
  final SignUpProviderWeb signUpProviderWeb;

  SignUpProviderCubit(this.signUpProviderWeb) : super(SignUpProviderInitial());

  Future<void> cubitProviderSignUP(String Name, String email, String password,
      String confirmPassword, String commercialNumber) async {
    emit(SignUpProviderLoading());
    try {
      await signUpProviderWeb.SignUpProvider(
          Name, email, password, confirmPassword, commercialNumber);

      // providerSharedState.setEmail(email);

      emit(SignUpProviderSuccess());
    } on SocketException {
      emit(SignUpProviderFailure('No internet connection.'));
    } on HttpException catch (e) {
      if (e.message.contains('email already exists!! (and 1 more error)')) {
        emit(SignUpProviderFailure('The email already exists.'));
      } else {
        emit(SignUpProviderFailure(e.toString()));
      }
    } on Exception catch (e) {
      emit(SignUpProviderFailure(e.toString()));
    }
  }
}
