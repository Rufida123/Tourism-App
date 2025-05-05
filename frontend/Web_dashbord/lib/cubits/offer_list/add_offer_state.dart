import 'package:flutter/material.dart';

@immutable
abstract class AddOfferState {}

class AddOfferInitial extends AddOfferState {}

class AddOfferSuccess extends AddOfferState {}

class AddOfferLoading extends AddOfferState {}

class AddOfferFailure extends AddOfferState {
  final String errorMessage;

  AddOfferFailure(this.errorMessage);
}
