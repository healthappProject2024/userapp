import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/therapist/add-user/domain/usecase/add_user_usecase.dart';
part 'add_user_event.dart';
part 'add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  final AddUserUseCase addUserUseCase;

  AddUserBloc({required this.addUserUseCase}) : super(AddUserInitial()) {
    on<AdduserTapped>(_onAddUserTapped);
  }

  Future<void> _onAddUserTapped(
      AdduserTapped event, Emitter<AddUserState> emit) async {
    emit(AdduserLoading());
    final result = await addUserUseCase(
      name: event.name,
      email: event.email,
      password: event.password,
      imageFile: event.imagePath,
      therapisName: event.therapisName,
    );

    result.fold(
      (failure) => emit(
        AddUserFailure(message: failure.message),
      ),
      (_) => emit(AdduserSuccess()),
    );
  }
}
