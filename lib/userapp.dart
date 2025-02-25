import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:userapp/config/route/route_controller.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/config/theme/darktheme.dart';
import 'package:userapp/config/theme/lighttheme.dart';

class Userapp extends StatelessWidget {
  const Userapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375.0, 812.0),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Lighttheme.lightTheme,
          darkTheme: Darktheme.darkTheme,
          themeMode: ThemeMode.system,
          initialRoute: RouteName.decisionmaker,
          onGenerateRoute: RouteController.generateRoute,
        );
      },
    );
  }
}
