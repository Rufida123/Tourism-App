part of 'profile_cubit.dart';


@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileUpLoading extends ProfileState {}

class ProfileUpSuccess extends ProfileState {}

class ProfileUpFailure extends ProfileState {
  final String error;

  ProfileUpFailure(this.error);
}
