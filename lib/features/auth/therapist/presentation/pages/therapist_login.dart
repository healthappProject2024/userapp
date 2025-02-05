import 'package:flutter/material.dart';
import 'package:userapp/config/route/route_name.dart';
import 'package:userapp/features/auth/shared/login.dart';

class TherapistLogin extends StatefulWidget {
  const TherapistLogin({super.key});

  @override
  State<TherapistLogin> createState() => _TherapistLoginState();
}

class _TherapistLoginState extends State<TherapistLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController(); 
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, 
      child: Login(
        emailController: emailController,
        passwordController: passwordController,
        loginButtonOnpressed: () {
          if (formKey.currentState!.validate()) { 
            Navigator.pushReplacementNamed(context, RouteName.therapistHome);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
