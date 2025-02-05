import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/onboarding/domain/entity/onboarding.dart';
import 'package:userapp/features/onboarding/domain/usecase/onboarding_usecase.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingUseCase onboardingUseCase;

  OnboardingCubit({required this.onboardingUseCase}) : super(OnboardingInitial());

  Future<void> checkOnboardingStatus() async {
    try {
      emit(OnboardingLoading());
      final onboarding = await onboardingUseCase.getOnboardingStatus();
      if(onboarding.status){
        emit(OnboardingCompleted(onboarding));
      } else {
        emit(OnboardingInitial());
      }
    } catch (e) {
      emit(OnboardingError('Failed to load onboarding status: $e'));
    }
  }

  Future<void> completeOnboarding() async {
    try {
      emit(OnboardingLoading());
      final onboarding = await onboardingUseCase.completeOnboarding();
      emit(OnboardingCompleted(onboarding));
    } catch (e) {
      emit(OnboardingError('Failed to complete onboarding: $e'));
    }
  }
}