import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/shared/login_status/presentation/cubit/login_status_cubit.dart';
import 'package:userapp/features/auth/shared/widgets/login.dart';
import 'package:userapp/features/auth/therapist/presentation/bloc/therapist_login_bloc.dart';
import 'package:userapp/features/therapist/home/presentation/pages/therapist_home.dart';

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
    return BlocBuilder<TherapistLoginBloc, TherapistLoginState>(
      builder: (context, state) {
        if (state is TherapistLoginLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TherapistLoginSuccess) {
          return const TherapistHome();
        } else if (state is TherapistLoginFailure) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${state.errorMessage}"), 
            ),
          );
        }

        return Scaffold(
          body: Form(
            key: formKey,
            child: Login(
              emailController: emailController,
              passwordController: passwordController,
              loginButtonOnpressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<TherapistLoginBloc>().add(
                        LoginTherapist(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                 context.read<LoginStatusCubit>().saveLoginStatus(role: "therapist");
                }
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
