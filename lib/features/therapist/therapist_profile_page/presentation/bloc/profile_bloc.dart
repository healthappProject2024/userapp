import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/therapist/therapist_profile_page/domain/entity/user.dart';
import 'package:userapp/features/therapist/therapist_profile_page/domain/usecase/fetch_profile_usecase.dart';
import 'package:userapp/features/therapist/therapist_profile_page/domain/usecase/logout_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchProfileUsecase _profileUsecase;
  final LogoutUsecase _logoutUsecase;
  ProfileBloc({
    required FetchProfileUsecase profileUsecase,
    required LogoutUsecase logoutUsecase,
  })  : _profileUsecase = profileUsecase,
        _logoutUsecase = logoutUsecase,
        super(ProfileInitial()) {
    on<FetchProfileData>((event, emit) async {
      try {
        emit(ProfileLoading());
        final profile = await _profileUsecase();
        if (profile == null) {
          emit(
            ProfileFetchError(
              errorMessage: "there is an issue while Loading",
            ),
          );
        } else {
          emit(ProfileFetched(profile));
        }
      } catch (e) {
        emit(
          ProfileFetchError(
            errorMessage: e.toString(),
          ),
        );
      }
    });

    on<LogOut>((event, emit) async {
      emit(ProfileLoading());
      try {
        await _logoutUsecase();
        emit(LogOutSuccess());
      } catch (e) {
        emit(
          LogOutFailedError(
            message: e.toString(),
          ),
        );
      }
    });
  }
}
