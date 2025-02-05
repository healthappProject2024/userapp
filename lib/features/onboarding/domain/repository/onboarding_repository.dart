import 'package:userapp/features/onboarding/domain/entity/onboarding.dart';

abstract interface class OnboardingRepository {
  Future<Onboarding> completeOnboarding();
  Future<Onboarding> checkingOnboarding();
}