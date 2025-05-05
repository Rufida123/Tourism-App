import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/log%20Out/log_out_state.dart';
import 'package:web_dashbord/cubits/log%20Out/log_out_web.dart';

class LogOutCubit extends Cubit<LogOutState> {
  final LogOutWeb addTripDetailsWeb;
  static LogOutCubit get(context) => BlocProvider.of(context);

  LogOutCubit(this.addTripDetailsWeb) : super(LogOutInitial());

  Future<void> cubitDeleteTripOutDetails() async {
    emit(LogOutLoading());
    try {
      print("trying booking cubit");
      await addTripDetailsWeb.fetchLogOut();

      emit(LogOutSuccess());
    } on Exception catch (e) {
      emit(LogOutFailure(e.toString()));
    }
  }
}
