part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

final class AccountInitial extends AccountState {}
final class AccountLoading extends AccountState {}
final class AccountSuccess extends AccountState {}
final class AccountFailure extends AccountState {
   final String message;

  AccountFailure(this.message);
}
