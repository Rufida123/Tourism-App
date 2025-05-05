import 'dart:io';

import 'package:app/data/models/user_models/profile_model.dart';
import 'package:app/data/web_service/user/profile_update_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileWeb profileWeb;

  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModel? profileModel;

  ProfileCubit(this.profileWeb) : super(ProfileInitial());

  Future<void> cubitProfile(String firstName, String lastName) async {
    emit(ProfileUpLoading());
    try {
      print('trying cubit');
      profileModel = await profileWeb.updateProfile(firstName, lastName);
      emit(ProfileUpSuccess());
    } on Exception catch (e) {
      emit(ProfileUpFailure(e.toString()));
    }
  }
}
