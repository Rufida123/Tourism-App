abstract class HomePageState {}

class HomePageInitialState extends HomePageState {}
class HomePageLoadingState extends HomePageState {}
class HomePageDataSuccess extends HomePageState {
  int? userCountToMainPage;
  HomePageDataSuccess(this.userCountToMainPage);
}