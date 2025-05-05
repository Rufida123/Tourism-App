import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_room_state.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_room_web.dart';

class AddRoomCubit extends Cubit<AddRoomState> {
  final AddRoomWeb addRoomWeb;
  static AddRoomCubit get(context) => BlocProvider.of(context);
  int? response;
  AddRoomCubit(this.addRoomWeb) : super(AddRoomInitial());

  Future<void> cubitAddRoom(final String? capacity, final String? price,
      final String? description, String roomId) async {
    emit(AddRoomLoading());
    try {
      print("trying cubit");
      response =
          await addRoomWeb.fetchAddRoom(capacity, price, description, roomId);

      emit(AddRoomSuccess());
    } on Exception catch (e) {
      emit(AddRoomFailure(e.toString()));
    }
  }
}

class AddRoomTypeCubit extends Cubit<AddRoomState> {
  final AddRoomTypeWeb addRoomTypeWeb;
  static AddRoomTypeCubit get(context) => BlocProvider.of(context);
  AddRoomTypeCubit(this.addRoomTypeWeb) : super(AddRoomTypeInitial());

  Future<void> cubitAddRoomType(
    final String name,
    final String roomId,
  ) async {
    emit(AddRoomTypeLoading());
    try {
      print("trying cubit");

      await addRoomTypeWeb.fetchAddRoomType(name, roomId);

      emit(AddRoomTypeSuccess());
    } on Exception catch (e) {
      emit(AddRoomTypeFailure(e.toString()));
    }
  }
}

class AddRoomFeaturesCubit extends Cubit<AddRoomState> {
  final AddRoomFeaturesWeb addRoomFeaturesWeb;
  static AddRoomFeaturesCubit get(context) => BlocProvider.of(context);
  AddRoomFeaturesCubit(this.addRoomFeaturesWeb) : super(AddRoomTypeInitial());

  Future<void> cubitAddRoomFeatures(
    final String name,
    final String roomId,
  ) async {
    emit(AddRoomFeaturesLoading());
    try {
      print("trying cubit");

      await addRoomFeaturesWeb.fetchAddRoomFeatures(name, roomId);

      emit(AddRoomFeaturesSuccess());
    } on Exception catch (e) {
      emit(AddRoomFeaturesFailure(e.toString()));
    }
  }
}
