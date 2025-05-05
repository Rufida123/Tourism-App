import 'package:app/data/models/user_models/account_model.dart';
import 'package:app/data/web_service/user/account_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountWeb accountWeb;

  static AccountCubit get(context) => BlocProvider.of(context);
  AccountModel? account;
  AccountCubit(this.accountWeb) : super(AccountInitial());

  Future<void> cubitAccount() async {
    emit(AccountLoading());
    try {
      print('trying cubit');
      account = await accountWeb.fetchAccountProfile();

      emit(AccountSuccess());
    } on Exception catch (e) {
      emit(AccountFailure(e.toString()));
    }
  }

  Future<void> refreshAccount() async {
    await cubitAccount();
  }
}
