import 'dart:io';

import 'package:app/data/web_service/user/signUp_web.dart';
import 'package:app/pages/User/cubits/signup_cubit/cubit/signup_state.dart';
import 'package:bloc/bloc.dart';

class SignUpUserCubit extends Cubit<SignUpUserState> {
  final SignUpUserWeb signUpUserWeb;
  SignUpUserCubit(this.signUpUserWeb) : super(SignUpUserInitial());

  Future<void> cubitUserSignUP(String email, String firstName, String lastName,
      String password, String confirmPassword, String phone) async {
    emit(SignUpUserLoading());
    try {
      await signUpUserWeb.SignUpUser(
          email, firstName, lastName, password, confirmPassword, phone);
      // userSharedState.setEmail(email);

      emit(SignUpUserSuccess());
    } on SocketException {
      emit(SignUpUserFailure('No internet connection.'));
    } on HttpException catch (e) {
      if (e.message.contains('email already exists!! (and 1 more error)')) {
        emit(SignUpUserFailure('The email already exists.'));
      } else {
        emit(SignUpUserFailure(e.toString()));
      }
    } on Exception catch (e) {
      emit(SignUpUserFailure(e.toString()));
    }
  }
}
