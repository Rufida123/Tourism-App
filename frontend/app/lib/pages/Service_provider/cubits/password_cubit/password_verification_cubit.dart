import 'package:app/data/web_service/service_provider/passwor_verification_web.dart';
import 'package:app/pages/Service_provider/cubits/password_cubit/password_verification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderPassVerifiCubit extends Cubit<ProviderPassVerifiState> {
  final ProviderPassVerifiWeb providerPassVerifiWeb;
  ProviderPassVerifiCubit(this.providerPassVerifiWeb)
      : super(ProviderPassVerifiInitial());
  Future<void> cubitProviderPassVerifi(String code, String email) async {
    emit(ProviderPassVerifiLoading());
    try {
      await providerPassVerifiWeb.providerPassVerifi(code, email);
      emit(ProviderPassVerifiSuccess());
    } on Exception catch (e) {
      emit(ProviderPassVerifiFailure(e.toString()));
    }
  }
}
