import 'package:flutter/material.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/features/auth/shared/widgets/login.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final emailController = TextEditingController();
  final passeordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Login(
      emailController: emailController,
      passwordController: passeordController,
      loginButtonOnpressed: () {
        Navigator.pushReplacementNamed(context, RouteName.profileComplete);
      },
    );
  }
}
