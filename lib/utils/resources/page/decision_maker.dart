import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/shared/login_decision.dart';
import 'package:userapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:userapp/features/onboarding/presentation/pages/get_started.dart';

class DecisionMaker extends StatelessWidget {
  const DecisionMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (ctx, state) {
          if (state is OnboardingLoading) {
            return Scaffold(
              body: Center(
                child: Text("Loading..."),
              ),
            );
          } else if (state is OnboardingCompleted) {
            return LoginDecision();
          } else if (state is OnboardingInitial) {
            return GetStarted();
          } else if (state is OnboardingError) {
            return Scaffold(
              body: Center(
                child: Text('Error: ${state.message}'),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Text('Unknown state'),
              ),
            );
          }
        },
      ),
    );
  }
}
