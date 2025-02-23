import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/therapist/domain/entity/therapist.dart';
import 'package:userapp/features/auth/therapist/domain/usecase/save_therapist_data.dart';
import 'package:userapp/features/auth/therapist/domain/usecase/threapist_login.dart';
import 'package:userapp/utils/resources/error/failures.dart';
import 'package:fpdart/fpdart.dart';
part 'therapist_login_event.dart';
part 'therapist_login_state.dart';

class TherapistLoginBloc
    extends Bloc<TherapistLoginEvent, TherapistLoginState> {
  final TherapistLoginUseCase _therapistLoginUseCase;
  final SaveTherapistDataUsecase _saveTherapistDataUsecase;

  TherapistLoginBloc(
      {required TherapistLoginUseCase therapistLoginUseCase,
      required SaveTherapistDataUsecase saveTherapistDataUsecase})
      : _therapistLoginUseCase = therapistLoginUseCase,
        _saveTherapistDataUsecase = saveTherapistDataUsecase,
        super(TherapistLoginInitial()) {
    on<LoginTherapist>((event, emit) async {
      emit(TherapistLoginLoading());
      final Either<Failures, Therapist> result = await _therapistLoginUseCase(
        email: event.email,
        password: event.password,
      );
      result.fold(
        (failure) => emit(TherapistLoginFailure(errorMessage: failure.message)),
        (therapist) async {
          final therapistJson = jsonEncode(therapist.toJson());
          await _saveTherapistDataUsecase.call(data: therapistJson);
          emit(TherapistLoginSuccess(therapist: therapist));
        },
      );
    });
  }
}
