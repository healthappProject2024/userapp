part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}


class OnboardingLoading extends OnboardingState {}



class OnboardingCompleted extends OnboardingState {
  final Onboarding onboarding;

  OnboardingCompleted(this.onboarding);
}

class OnboardingError extends OnboardingState {
  final String message;

  OnboardingError(this.message);
}