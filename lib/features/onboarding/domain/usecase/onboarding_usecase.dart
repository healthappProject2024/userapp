import 'package:userapp/features/onboarding/domain/entity/onboarding.dart';
import 'package:userapp/features/onboarding/domain/repository/onboarding_repository.dart';

class OnboardingUseCase {
  final OnboardingRepository onboardingRepository;

  OnboardingUseCase({required this.onboardingRepository});

  Future<Onboarding> getOnboardingStatus() async {
    try {
      return await onboardingRepository.checkingOnboarding();
    } catch (e) {
      throw Exception('Failed to fetch onboarding status: $e');
    }
  }

  Future<Onboarding> completeOnboarding() async {
    try {
      return await onboardingRepository.completeOnboarding();
    } catch (e) {
      throw Exception('Failed to complete onboarding: $e');
    }
  }
}
