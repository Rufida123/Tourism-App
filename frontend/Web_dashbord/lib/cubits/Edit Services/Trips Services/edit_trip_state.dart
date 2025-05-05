import 'package:flutter/foundation.dart';

@immutable
abstract class EditTripDetailsState {}

class EditTripOutDetailsInitial extends EditTripDetailsState {}

class EditTripOutDetailsLoading extends EditTripDetailsState {}

class EditTripOutDetailsSuccess extends EditTripDetailsState {}

class EditTripOutDetailsFailure extends EditTripDetailsState {
  final String errorMessage;
  EditTripOutDetailsFailure(this.errorMessage);
}

class EditTripInDetailsInitial extends EditTripDetailsState {}

class EditTripInDetailsLoading extends EditTripDetailsState {}

class EditTripInDetailsSuccess extends EditTripDetailsState {}

class EditTripInDetailsFailure extends EditTripDetailsState {
  final String errorMessage;
  EditTripInDetailsFailure(this.errorMessage);
}

class EditTripActivityDetailsInitial extends EditTripDetailsState {}

class EditTripActivityDetailsLoading extends EditTripDetailsState {}

class EditTripActivityDetailsSuccess extends EditTripDetailsState {}

class EditTripActivityDetailsFailure extends EditTripDetailsState {
  final String errorMessage;
  EditTripActivityDetailsFailure(this.errorMessage);
}
