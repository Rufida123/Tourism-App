import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/assest/data%20and%20model/users_model.dart';
import 'package:web_dashbord/cubits/users%20page%20cubit/users_state.dart';
import 'package:web_dashbord/cubits/users%20page%20cubit/users_web.dart';

class UsersDetailsCubit extends Cubit<UsersDetailsState> {
  UsersDetailsWeb usersDetailsWeb;
  List<UsersModel> list = [];
  static UsersDetailsCubit get(context) => BlocProvider.of(context);

  UsersDetailsCubit(this.usersDetailsWeb) : super(UsersDetailsInitial());

  Future<void> cubitUsersDetails() async {
    emit(UsersDetailsLoading());
    try {
      print('trying cubit');
      list = await usersDetailsWeb.fetchUsersList();
      print(list);
      emit(UsersDetailsSuccess());
    } on Exception catch (e) {
      emit(UsersDetailsFailure(e.toString()));
    }
  }
}

class UsersAddCashCubit extends Cubit<UsersDetailsState> {
  final UserAddCashWeb userAddCashWeb;
  static UsersAddCashCubit get(context) => BlocProvider.of(context);
  UsersAddCashCubit(this.userAddCashWeb) : super(UsersAddCashInitial());

  Future<void> cubitUserAddCash(String? userId, String? cash) async {
    emit(UsersAddCashLoading());
    try {
      print("trying booking cubit");
      await userAddCashWeb.addUserCash(userId, cash);

      emit(UsersAddCashSuccess());
    } on Exception catch (e) {
      emit(UsersAddCashFailure(e.toString()));
    }
  }
}
