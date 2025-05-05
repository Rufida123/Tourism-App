abstract class UsersDetailsState {}

class UsersDetailsInitial extends UsersDetailsState {}

class UsersDetailsLoading extends UsersDetailsState {}

class UsersDetailsSuccess extends UsersDetailsState {}

class UsersDetailsFailure extends UsersDetailsState {
  final String errorMessage;
  UsersDetailsFailure(this.errorMessage);
}

class UsersAddCashInitial extends UsersDetailsState {}

class UsersAddCashLoading extends UsersDetailsState {}

class UsersAddCashSuccess extends UsersDetailsState {}

class UsersAddCashFailure extends UsersDetailsState {
  final String errorMessage;
  UsersAddCashFailure(this.errorMessage);
}