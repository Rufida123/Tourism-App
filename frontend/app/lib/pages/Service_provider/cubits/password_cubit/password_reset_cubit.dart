import 'package:app/data/web_service/service_provider/password_reset_web.dart';
import 'package:app/pages/Service_provider/cubits/password_cubit/password_reset_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderPassResetCubit extends Cubit<ProviderPassResetState> {
  final ProviderPassResetWeb providerPassResetWeb;
  ProviderPassResetCubit(this.providerPassResetWeb)
      : super(ProviderPassResetInitial());
  Future<void> cubitProviderPassReset(
      String code, String password, String passwordConfirmation) async {
    emit(ProviderPassResetLoading());
    try {
      await providerPassResetWeb.providerPassReset(
          code, password, passwordConfirmation);
      emit(ProviderPassResetSuccess());
    } on Exception catch (e) {
      emit(ProviderPassResetFailure(e.toString()));
    }
  }
}
