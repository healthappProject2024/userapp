import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/features/onboarding/data/local_data_source/local_data_source.dart';
import 'package:userapp/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:userapp/features/onboarding/domain/usecase/onboarding_usecase.dart';
import 'package:userapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:userapp/userapp.dart';
import 'package:userapp/utils/service/local_data_service.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => OnboardingCubit(
            onboardingUseCase: OnboardingUseCase(
              onboardingRepository: OnboardingRepositoryImpl(
                localDataSource: LocalDataSourceImpl(
                  localDataService: LocalDataService(prefs: pref),
                ),
              ),
            ),
          )..checkOnboardingStatus(),
        )
      ],
      child: const Userapp(),
    ),
  );
  FlutterNativeSplash.remove();
}
