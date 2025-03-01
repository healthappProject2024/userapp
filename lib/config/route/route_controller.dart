import 'package:flutter/material.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/features/auth/shared/pages/login_decision.dart';
import 'package:userapp/features/auth/therapist/presentation/pages/therapist_login.dart';
import 'package:userapp/features/auth/user/presentation/pages/profile_complete.dart';
import 'package:userapp/features/auth/user/presentation/pages/user_login.dart';
import 'package:userapp/features/onboarding/presentation/pages/get_started.dart';
import 'package:userapp/features/onboarding/presentation/pages/introduction.dart';
import 'package:userapp/features/therapist/add-user/presentation/pages/add_user.dart';
import 'package:userapp/features/therapist/home/presentation/pages/therapist_home.dart';
import 'package:userapp/features/therapist/therapist_message/presentation/page/message_detail_page.dart';
import 'package:userapp/features/user/home/presentation/pages/user_home.dart';
import 'package:userapp/utils/resources/page/decision_maker.dart';

class RouteController {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.decisionmaker:
        return MaterialPageRoute(builder: (_) => DecisionMaker());
      case RouteName.getstarted:
        return MaterialPageRoute(builder: (_) => GetStarted());
      case RouteName.introduction:
        return MaterialPageRoute(builder: (_) => Introduction());
      case RouteName.loginDecision:
        return MaterialPageRoute(builder: (_) => LoginDecision());
      case RouteName.userlogin:
        return MaterialPageRoute(builder: (_) => UserLogin());
      case RouteName.therapistlogin:
        return MaterialPageRoute(builder: (_) => TherapistLogin());
      case RouteName.profileComplete:
        return MaterialPageRoute(builder: (_) => ProfileComplete());
      case RouteName.userHome:
        return MaterialPageRoute(builder: (_) => UserHome());
      case RouteName.therapistHome:
        return MaterialPageRoute(builder: (_) => TherapistHome());
      case RouteName.adduser:
        if (settings.arguments is String) {
          final String therapistName = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => AddUser(therapisName: therapistName),
          );
        }
        return _errorRoute();

      case RouteName.messageDetailPage:
        if (settings.arguments is Map<String, dynamic>) {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => MessageDetailPage(
              message: args['message'],
              time: args['time'],
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body:
            Center(child: Text("Invalid or missing arguments for this route")),
      ),
    );
  }
}
