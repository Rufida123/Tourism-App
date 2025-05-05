import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/Edit%20Services/rooms%20services/edit_room_state.dart';
import 'package:web_dashbord/cubits/Edit%20Services/rooms%20services/edit_room_web.dart';

class EditRoomCubit extends Cubit<EditRoomState> {
  final EditRoomWeb addRoomWeb;
  static EditRoomCubit get(context) => BlocProvider.of(context);
  int? response;
  EditRoomCubit(this.addRoomWeb) : super(EditRoomInitial());

  Future<void> cubitAddRoom(final String? capacity, final String? price,
      final String? description, String roomId) async {
    emit(EditRoomLoading());
    try {
      print("trying cubit");

      await addRoomWeb.fetchAddRoom(capacity, price, description, roomId);

      emit(EditRoomSuccess());
    } on Exception catch (e) {
      emit(EditRoomFailure(e.toString()));
    }
  }
}

class EditRoomTypeCubit extends Cubit<EditRoomState> {
  final EditRoomTypeWeb addRoomTypeWeb;
  static EditRoomTypeCubit get(context) => BlocProvider.of(context);
  EditRoomTypeCubit(this.addRoomTypeWeb) : super(EditRoomTypeInitial());

  Future<void> cubitEditRoomType(
    final String name,
    final String roomId,
  ) async {
    emit(EditRoomTypeLoading());
    try {
      print("trying cubit");

      await addRoomTypeWeb.fetchEditRoomType(name, roomId);

      emit(EditRoomTypeSuccess());
    } on Exception catch (e) {
      emit(EditRoomTypeFailure(e.toString()));
    }
  }
}

class EditRoomFeaturesCubit extends Cubit<EditRoomState> {
  final EditRoomFeaturesWeb addRoomFeaturesWeb;
  static EditRoomFeaturesCubit get(context) => BlocProvider.of(context);
  EditRoomFeaturesCubit(this.addRoomFeaturesWeb) : super(EditRoomTypeInitial());

  Future<void> cubitAddRoomFeatures(
    final String name,
    final String roomId,
  ) async {
    emit(EditRoomFeaturesLoading());
    try {
      print("trying cubit");

      await addRoomFeaturesWeb.fetchEditRoomFeatures(name, roomId);

      emit(EditRoomFeaturesSuccess());
    } on Exception catch (e) {
      emit(EditRoomFeaturesFailure(e.toString()));
    }
  }
}
