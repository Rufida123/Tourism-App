import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/crud.dart';
import 'package:web_dashbord/cubits/home%20page%20bloc/home_page_event.dart';
import 'package:web_dashbord/cubits/home%20page%20bloc/home_page_state.dart';
import 'package:web_dashbord/screens/main_page.dart';
import 'package:web_dashbord/url_api.dart';

class HomePageBloc extends Bloc<HomePageEvent ,HomePageState> {
  Crud? crud = Crud();
  HomePageBloc(): super(HomePageInitialState()){
    on<GetHomePageData>(getHomeData);
  }



  FutureOr<void> getHomeData(GetHomePageData event, Emitter<HomePageState> emit) async{
    emit (HomePageLoadingState());

      var userCount =  await crud?.anas(usersCountUrl);
      countUser = userCount['data'];
      emit (HomePageDataSuccess(countUser));


  }
}