import 'package:app/data/models/user_models/trip_list_model.dart';
import 'package:app/data/web_service/user/trip_add_to_favorite_web.dart';
import 'package:app/data/web_service/user/trip_favorite_list_page_web.dart';
import 'package:app/data/web_service/user/trip_list_web.dart';
import 'package:app/data/web_service/user/trip_remove_from_favorite_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'list_state.dart';

class TripListCubit extends Cubit<TripListState> {
  final TripListWeb tripListWeb;

  static TripListCubit get(context) => BlocProvider.of(context);
  List<TripListModel> trips = [];
  TripListCubit(this.tripListWeb) : super(TripListInitial());

  Future<void> cubitTripList() async {
    emit(TripListLoading());
    try {
      trips = await tripListWeb.fetchTripList();

      emit(TripListSuccess());
    } on Exception catch (e) {
      emit(TripListFailure(e.toString()));
    }
  }
}

class TripAddToFavoriteCubit extends Cubit<TripListState> {
  TripAddToFavoriteWeb tripAddToFavoriteWeb;
  TripAddToFavoriteCubit(this.tripAddToFavoriteWeb)
      : super(TripAddToFavoriteInitial());

  Future<void> addToFavorites(int hotelId) async {
    emit(TripAddToFavoriteLoading());
    try {
      await tripAddToFavoriteWeb.tripAddToFavorite(hotelId);
      emit(TripAddToFavoriteSuccess());
    } catch (e) {
      emit(TripAddToFavoriteFailure('Failed to add hotel to favorites: $e'));
    }
  }
}

class TripRemoveFromFavoriteCubit extends Cubit<TripListState> {
  TripRemoveFromFavoriteWeb tripRemoveFromFavoriteWeb;
  TripRemoveFromFavoriteCubit(this.tripRemoveFromFavoriteWeb)
      : super(TripRemoveFromFavoriteInitial());

  Future<void> RemoveFromFavorites(int tripId) async {
    emit(TripRemoveFromFavoriteLoading());
    try {
      await tripRemoveFromFavoriteWeb.tripRemoveFromFavorite(tripId);
      emit(TripRemoveFromFavoriteSuccess());
    } catch (e) {
      emit(TripRemoveFromFavoriteFailure(
          'Failed to add hotel to favorites: $e'));
    }
  }
}

class TripFavoriteCubit extends Cubit<TripListState> {
  final TripFavoriteWeb tripFavoriteWeb;

  static TripFavoriteCubit get(context) => BlocProvider.of(context);
  List<dynamic> trips = [];
  TripFavoriteCubit(this.tripFavoriteWeb) : super(TripFavoriteInitial());

  Future<void> cubitTripFavorite() async {
    emit(TripFavoriteLoading());
    try {
      trips = await tripFavoriteWeb.fetchTripFavorite();

      emit(TripFavoriteSuccess());
    } on Exception catch (e) {
      emit(TripFavoriteFailure(e.toString()));
    }
  }
}
