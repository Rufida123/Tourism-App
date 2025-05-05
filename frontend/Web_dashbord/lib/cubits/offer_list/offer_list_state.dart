part of 'offer_list_cubit.dart';

@immutable
abstract class OfferListState {}

 class OfferListInitial extends OfferListState {}
  class OfferListSuccess extends OfferListState {}
   class OfferListLoading extends OfferListState {}
    class OfferListFailure extends OfferListState {
        final String errorMessage;

  OfferListFailure(this.errorMessage);
    }
