import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/user/presentation/bloc/user_login_bloc.dart';
import 'package:userapp/features/auth/user/presentation/pages/profile_complete.dart';
import 'package:userapp/features/user/home/presentation/pages/user_home.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      context.read<UserLoginBloc>().add(
            UserLogingIn(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserLoginBloc, UserLoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLogingFirstTime) {
            return ProfileComplete();
          } else if (state is UserLoggedIn) {
            return UserHome();
          } else if(state is LoginError){
            Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
