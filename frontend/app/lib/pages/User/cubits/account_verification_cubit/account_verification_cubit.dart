import 'package:app/data/web_service/user/account_verification_web.dart';
import 'package:app/pages/User/cubits/account_verification_cubit/account_verification_state.dart';
import 'package:bloc/bloc.dart';

class UserAccVerifiCubit extends Cubit<UserAccVerificationState> {
  final AccVerifiUserWeb accVerifiUserWeb;
  UserAccVerifiCubit(this.accVerifiUserWeb) : super(UserAccVerifiInitial());
  Future<void> cubitUserAccVerifi(String code, String email) async {
    emit(UserAccVerifiLoading());
    try {
      await accVerifiUserWeb.accVerifiUser(email, code);
      emit(UserAccVerifiSuccess());
    } on Exception catch (e) {
      emit(UserAccVerifiFailure(e.toString()));
    }
  }
}
