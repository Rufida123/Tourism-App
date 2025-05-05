import 'package:app/data/web_service/user/favorite_flight_list_web.dart';
import 'package:app/data/web_service/user/flight_add_to_favorite_web.dart';
import 'package:app/data/web_service/user/flight_list_web.dart';
import 'package:app/data/web_service/user/flight_remove_from_favorite_wev.dart';
import 'package:app/pages/User/cubits/flight_cubit/show_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightListCubit extends Cubit<FlightListState> {
  final FlightListWeb flightListWeb;

  static FlightListCubit get(context) => BlocProvider.of(context);
  List<dynamic> flights = [];
  FlightListCubit(this.flightListWeb) : super(FlightListInitial());

  Future<void> cubitFlightList() async {
    emit(FlightListLoading());
    try {
      print('trying cubit');
      flights = await flightListWeb.fetchFlightList();

      emit(FlightListSuccess());
    } on Exception catch (e) {
      emit(FlightListFailure(e.toString()));
    }
  }
}

class FlightAddToFavoriteCubit extends Cubit<FlightListState> {
  FlightAddToFavoriteWeb flightAddToFavoriteWeb;
  FlightAddToFavoriteCubit(this.flightAddToFavoriteWeb)
      : super(FlightAddToFavoriteInitial());
  static FlightAddToFavoriteCubit get(context) => BlocProvider.of(context);
  Future<void> addToFavorites(int id) async {
    emit(FlightAddToFavoriteLoading());
    try {
      await flightAddToFavoriteWeb.flightAddToFavorite(id);
      emit(FlightAddToFavoriteSuccess());
    } catch (e) {
      emit(FlightAddToFavoriteFailure('Failed to add flight to favorites: $e'));
    }
  }
}

class FlightFavoriteCubit extends Cubit<FlightListState> {
  final FlightFavoriteWeb flightFavoriteWeb;

  static FlightFavoriteCubit get(context) => BlocProvider.of(context);
  List<dynamic> flights = [];
  FlightFavoriteCubit(this.flightFavoriteWeb) : super(FlightFavoriteInitial());

  Future<void> cubitFlightFavorite() async {
    emit(FlightFavoriteLoading());
    try {
      flights = await flightFavoriteWeb.fetchFlightFavorite();

      emit(FlightFavoriteSuccess());
    } on Exception catch (e) {
      emit(FlightFavoriteFailure(e.toString()));
    }
  }
}

class FlightRemoveFromFavoriteCubit extends Cubit<FlightListState> {
  FlightRemoveFromFavoriteWeb flightRemoveFromFavoriteWeb;
  FlightRemoveFromFavoriteCubit(this.flightRemoveFromFavoriteWeb)
      : super(FlightRemoveFromFavoriteInitial());

  Future<void> RemoveFromFavorites(int flightId) async {
    emit(FlightRemoveFromFavoriteLoading());
    try {
      await flightRemoveFromFavoriteWeb.flightRemoveFromFavorite(flightId);
      emit(FlightRemoveFromFavoriteSuccess());
    } catch (e) {
      emit(FlightRemoveFromFavoriteFailure(
          'Failed to add flight to favorites: $e'));
    }
  }
}
