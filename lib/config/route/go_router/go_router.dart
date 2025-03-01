import 'package:go_router/go_router.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/features/auth/shared/pages/login_decision.dart';
import 'package:userapp/features/auth/user/presentation/pages/user_login.dart';
import 'package:userapp/features/onboarding/presentation/pages/get_started.dart';
import 'package:userapp/features/onboarding/presentation/pages/introduction.dart';
import 'package:userapp/features/therapist/home/presentation/pages/therapist_home.dart';
import 'package:userapp/utils/resources/page/decision_maker.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteName.loginDecision,
  routes: [
    GoRoute(
      path: RouteName.decisionmaker,
      builder: (context, state) => DecisionMaker(),
    ),
    GoRoute(
      path: RouteName.getstarted,
      builder: (context, state) => GetStarted(),
    ),
    GoRoute(
      path: RouteName.introduction,
      name: 'introduction',
      builder: (context, state) => Introduction(),
    ),
    GoRoute(
      path: RouteName.loginDecision,
      name: "loginDecision",
      builder: (context, state) => LoginDecision(),
    ),
    GoRoute(
      path: RouteName.userlogin,
      name: 'userLogin',
      builder: (context, state) => UserLogin(),
    ),
    GoRoute(
      path: RouteName.therapistlogin,
      name: 'therapistLogin',
      builder: (context, state) => TherapistHome(),
    ),
  ],
);
