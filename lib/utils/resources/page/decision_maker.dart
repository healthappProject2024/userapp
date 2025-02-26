// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:userapp/features/auth/shared/pages/login_decision.dart';
// import 'package:userapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
// import 'package:userapp/features/onboarding/presentation/pages/get_started.dart';

// class DecisionMaker extends StatelessWidget {
//   const DecisionMaker({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<OnboardingCubit, OnboardingState>(
//         builder: (ctx, state) {
//           if (state is OnboardingLoading) {
//             return Scaffold(
//               body: Center(
//                 child: Text("Loading..."),
//               ),
//             );
//           } else if (state is OnboardingCompleted) {
//             return LoginDecision();
//           } else if (state is OnboardingInitial) {
//             return GetStarted();
//           } else if (state is OnboardingError) {
//             return Scaffold(
//               body: Center(
//                 child: Text('Error: ${state.message}'),
//               ),
//             );
//           } else {
//             return Scaffold(
//               body: Center(
//                 child: Text('Unknown state'),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/shared/login_status/presentation/cubit/login_status_cubit.dart';
import 'package:userapp/features/auth/shared/pages/login_decision.dart';
import 'package:userapp/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:userapp/features/onboarding/presentation/pages/get_started.dart';
import 'package:userapp/features/therapist/therapist_bottom_navigation/page/therapist_bottom_navigation.dart';
import 'package:userapp/features/user/home/presentation/pages/user_home.dart';

class DecisionMaker extends StatelessWidget {
  const DecisionMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (ctx, onboardingState) {
          if (onboardingState is OnboardingLoading) {
            return const Center(child: Text("Loading..."));
          } else if (onboardingState is OnboardingCompleted) {
            return BlocBuilder<LoginStatusCubit, LoginStatusState>(
              builder: (context, loginState) {
                if (loginState is LoginStatusLoaded) {
                  if (loginState.isLoggedIn) {
                    return loginState.role == "therapist" ? TherapistBottomNavigation() : UserHome();
                  } else {
                    return LoginDecision();
                  }
                } else if (loginState is LoginStatusError) {
                  return Center(child: Text('Error: ${loginState.message}'));
                }
                return const Center(child: Text("Checking login status..."));
              },
            );
          } else if (onboardingState is OnboardingInitial) {
            return GetStarted();
          } else if (onboardingState is OnboardingError) {
            return Center(child: Text('Error: ${onboardingState.message}'));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
