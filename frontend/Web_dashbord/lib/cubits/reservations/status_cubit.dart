import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/reservations/status_state.dart';
import 'package:web_dashbord/cubits/reservations/statuse_web.dart';

class StatusCubit extends Cubit<StatusState> {
  final StatusWeb addTripDetailsWeb;
  static StatusCubit get(context) => BlocProvider.of(context);

  StatusCubit(this.addTripDetailsWeb) : super(StatusInitial());

  Future<void> cubitDeleteTripOutDetails(String resId) async {
    emit(StatusLoading());
    try {
      print("trying booking cubit");
      await addTripDetailsWeb.fetchStatus(resId);

      emit(StatusSuccess());
    } on Exception catch (e) {
      emit(StatusFailure(e.toString()));
    }
  }
}
