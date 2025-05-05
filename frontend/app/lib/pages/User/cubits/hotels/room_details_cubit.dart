import 'package:app/data/web_service/user/hotel_room_details_web.dart';
import 'package:app/pages/User/cubits/hotels/room_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomDetailsCubit extends Cubit<RoomDetailsState> {
  final RoomDetailsWeb roomDetailsWeb;
  var room;
  static RoomDetailsCubit get(context) => BlocProvider.of(context);
  RoomDetailsCubit(this.roomDetailsWeb) : super(RoomDetailsInitial());
  Future<void> cubitRoomDetails(int roomId) async {
    emit(RoomDetailsLoading());
    try {
      print('trying room cubit');
      room = await roomDetailsWeb.fetchRoomDetails(roomId);

      emit(RoomDetailsSuccess());
    } catch (e) {
      emit(RoomDetailsFailure(e.toString()));
    }
  }
}
