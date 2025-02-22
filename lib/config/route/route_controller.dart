import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/features/auth/shared/pages/login_decision.dart';
import 'package:userapp/features/auth/therapist/presentation/pages/therapist_login.dart';
import 'package:userapp/features/auth/user/presentation/pages/profile_complete.dart';
import 'package:userapp/features/auth/user/presentation/pages/user_login.dart';
import 'package:userapp/features/onboarding/presentation/pages/get_started.dart';
import 'package:userapp/features/onboarding/presentation/pages/introduction.dart';
import 'package:userapp/features/therapist/add-user/presentation/pages/add_user.dart';
import 'package:userapp/features/therapist/home/presentation/pages/therapist_home.dart';
import 'package:userapp/features/user/home/presentation/pages/user_home.dart';
import 'package:userapp/utils/resources/page/decision_maker.dart';

class RouteController {
  static final route = {
    RouteName.decisionmaker: (ctx) => DecisionMaker(),
    RouteName.getstarted: (ctx) => GetStarted(),
    RouteName.introduction: (ctx) => Introduction(),
    RouteName.loginDecision: (ctx) => LoginDecision(),
    RouteName.userlogin: (ctx) => UserLogin(),
    RouteName.therapistlogin: (ctx) => TherapistLogin(),
    RouteName.profileComplete: (ctx) => ProfileComplete(),
    RouteName.userHome: (ctx) => UserHome(),
    RouteName.therapistHome: (ctx) => TherapistHome(),
    RouteName.adduser : (ctx) => AddUser(),
  };
}
