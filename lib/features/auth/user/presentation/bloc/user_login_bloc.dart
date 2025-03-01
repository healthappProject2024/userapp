import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/user/domain/usecase/save_user_data.dart';
import 'package:userapp/features/auth/user/domain/usecase/user_login.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final UserLoginUsecase _userLoginUsecase;
  final SaveUserDataUsecase _saveUserDataUsecase;
  UserLoginBloc(
      {required UserLoginUsecase userLoginUsecase,
      required SaveUserDataUsecase saveUserDataUsecase})
      : _saveUserDataUsecase = saveUserDataUsecase,
        _userLoginUsecase = userLoginUsecase,
        super(UserLoginInitial()) {
    on<UserLogingIn>((event, emit) async {
      emit(LoginLoading());
      final result = await _userLoginUsecase(
        email: event.email,
        password: event.password,
      );
      result.fold(
          (failure) => emit(
                LoginError(message: failure.message),
              ), (user) async {
        if (user.gender == null) {
          emit(UserLogingFirstTime());
        } else {
          final therapistJson = jsonEncode(user.toJson());
          await _saveUserDataUsecase.call(data: therapistJson);
          emit(UserLoggedIn());
        }
      });
    });
  }
}
