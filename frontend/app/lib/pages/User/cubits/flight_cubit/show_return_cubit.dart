import 'package:app/data/web_service/user/favorite_flight_return_list_web.dart';
import 'package:app/data/web_service/user/flight_return_add_to_favorite_web.dart';
import 'package:app/data/web_service/user/flight_return_list_web.dart';
import 'package:app/data/web_service/user/flight_return_remove_from_favorite_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'show_return_state.dart';

class FlightReturnListCubit extends Cubit<FlightReturnListState> {
  final FlightReturnListWeb flightReturnListWeb;

  static FlightReturnListCubit get(context) => BlocProvider.of(context);
  List<dynamic> flightReturn = [];
  FlightReturnListCubit(this.flightReturnListWeb)
      : super(FlightReturnListInitial());

  Future<void> cubitFlightReturnList() async {
    emit(FlightReturnListLoading());
    try {
      flightReturn = await flightReturnListWeb.fetchFlightReturnList();

      emit(FlightReturnListSuccess());
    } on Exception catch (e) {
      emit(FlightReturnListFailure(e.toString()));
    }
  }
}

class FlightReturnAddToFavoriteCubit extends Cubit<FlightReturnListState> {
  FlightReturnAddToFavoriteWeb flightReturnAddToFavoriteWeb;
  FlightReturnAddToFavoriteCubit(this.flightReturnAddToFavoriteWeb)
      : super(FlightReturnAddToFavoriteInitial());

  Future<void> addToFavorites(int id) async {
    emit(FlightReturnAddToFavoriteLoading());
    try {
      await flightReturnAddToFavoriteWeb.flightReturnAddToFavorite(id);
      emit(FlightReturnAddToFavoriteSuccess());
    } catch (e) {
      emit(FlightReturnAddToFavoriteFailure(
          'Failed to add flight to favorites: $e'));
    }
  }
}

class FlightReturnFavoriteCubit extends Cubit<FlightReturnListState> {
  final FlightReturnFavoriteWeb flightReturnFavoriteWeb;

  static FlightReturnFavoriteCubit get(context) => BlocProvider.of(context);
  List<dynamic> flightReturn = [];
  FlightReturnFavoriteCubit(this.flightReturnFavoriteWeb)
      : super(FlightReturnFavoriteInitial());

  Future<void> cubitFlightReturnFavorite() async {
    emit(FlightReturnFavoriteLoading());
    try {
      flightReturn = await flightReturnFavoriteWeb.fetchFlightReturnFavorite();

      emit(FlightReturnFavoriteSuccess());
    } on Exception catch (e) {
      emit(FlightReturnFavoriteFailure(e.toString()));
    }
  }
}

class FlightReturnRemoveFromFavoriteCubit extends Cubit<FlightReturnListState> {
  FlightReturnRemoveFromFavoriteWeb flightReturnRemoveFromFavoriteWeb;
  FlightReturnRemoveFromFavoriteCubit(this.flightReturnRemoveFromFavoriteWeb)
      : super(FlightReturnRemoveFromFavoriteInitial());

  Future<void> RemoveReturnFromFavorites(int id) async {
    emit(FlightReturnRemoveFromFavoriteLoading());
    try {
      await flightReturnRemoveFromFavoriteWeb
          .flightReturnRemoveFromFavorite(id);
      emit(FlightReturnRemoveFromFavoriteSuccess());
    } catch (e) {
      emit(FlightReturnRemoveFromFavoriteFailure(
          'Failed to add flight to favorites: $e'));
    }
  }
}
