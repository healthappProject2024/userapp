import 'package:userapp/features/onboarding/data/local_data_source/local_data_source.dart';
import 'package:userapp/features/onboarding/data/model/onboarding_model.dart';
import 'package:userapp/features/onboarding/domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final LocalDataSource localDataSource;

  OnboardingRepositoryImpl({required this.localDataSource});
  
  @override
  Future<OnboardingModel> checkingOnboarding() async {
        try {
      final status = await localDataSource.hasCompletedOnboarding();
      return OnboardingModel(status: status);
    } catch (e) {
      throw Exception('Error fetching onboarding status: $e');
    }
  }
  
  @override
  Future<OnboardingModel> completeOnboarding() async {
        try {
      await localDataSource.markOnboardingComplete();
      return OnboardingModel(status: true);
    } catch (e) {
      throw Exception('Error completing onboarding: $e');
    }
  }
}
