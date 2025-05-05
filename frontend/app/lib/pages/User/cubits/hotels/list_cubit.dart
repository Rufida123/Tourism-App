import 'package:app/data/models/user_models/hotel_list_model.dart';
import 'package:app/data/web_service/user/hotel_favorite_list_web.dart';
import 'package:app/data/web_service/user/hotel_add_to_favorite_web.dart';
import 'package:app/data/web_service/user/hotel_list_web.dart';
import 'package:app/data/web_service/user/hotel_remove_from_favorite_web.dart';
import 'package:app/pages/User/cubits/hotels/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelListCubit extends Cubit<HotelListState> {
  final HotelListWeb hotelListWeb;

  static HotelListCubit get(context) => BlocProvider.of(context);
  List<HotelListModel> hotels = [];
  HotelListCubit(this.hotelListWeb) : super(HotelListInitial());

  Future<void> cubitHotelList() async {
    emit(HotelListLoading());
    try {
      hotels = await hotelListWeb.fetchHotelList();

      emit(HotelListSuccess());
    } on Exception catch (e) {
      emit(HotelListFailure(e.toString()));
    }
  }
}

class HotelAddToFavoriteCubit extends Cubit<HotelListState> {
  HotelAddToFavoriteWeb hotelAddToFavoriteWeb;
  HotelAddToFavoriteCubit(this.hotelAddToFavoriteWeb)
      : super(HotelAddToFavoriteInitial());

  Future<void> addToFavorites(int hotelId) async {
    emit(HotelAddToFavoriteLoading());
    try {
      await hotelAddToFavoriteWeb.hotelAddToFavorite(hotelId);
      emit(HotelAddToFavoriteSuccess());
    } catch (e) {
      emit(HotelAddToFavoriteFailure('Failed to add hotel to favorites: $e'));
    }
  }
}

class HotelFavoriteCubit extends Cubit<HotelListState> {
  final HotelFavoriteWeb hotelFavoriteWeb;

  static HotelFavoriteCubit get(context) => BlocProvider.of(context);
  List<dynamic> hotels = [];
  HotelFavoriteCubit(this.hotelFavoriteWeb) : super(HotelFavoriteInitial());

  Future<void> cubitHotelFavorite() async {
    emit(HotelFavoriteLoading());
    try {
      hotels = await hotelFavoriteWeb.fetchHotelFavorite();

      emit(HotelFavoriteSuccess());
    } on Exception catch (e) {
      emit(HotelFavoriteFailure(e.toString()));
    }
  }
}

class HotelRemoveFromFavoriteCubit extends Cubit<HotelListState> {
  HotelRemoveFromFavoriteWeb hotelRemoveFromFavoriteWeb;
  HotelRemoveFromFavoriteCubit(this.hotelRemoveFromFavoriteWeb)
      : super(HotelRemoveFromFavoriteInitial());

  Future<void> RemoveFromFavorites(int hotelId) async {
    emit(HotelRemoveFromFavoriteLoading());
    try {
      await hotelRemoveFromFavoriteWeb.hotelRemoveFromFavorite(hotelId);
      emit(HotelRemoveFromFavoriteSuccess());
    } catch (e) {
      emit(HotelRemoveFromFavoriteFailure(
          'Failed to add hotel to favorites: $e'));
    }
  }
}
