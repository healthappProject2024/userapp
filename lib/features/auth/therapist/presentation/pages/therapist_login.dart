import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/shared/login_status/presentation/cubit/login_status_cubit.dart';
import 'package:userapp/features/auth/shared/widgets/login.dart';
import 'package:userapp/features/auth/therapist/presentation/bloc/therapist_login_bloc.dart';
import 'package:userapp/features/therapist/therapist_bottom_navigation/page/therapist_bottom_navigation.dart';
import 'package:userapp/utils/resources/widgets/commone_dialouge_box.dart';

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
    return BlocConsumer<TherapistLoginBloc, TherapistLoginState>(
      listener: (context, state) {
        if (state is TherapistLoginFailure) {
          return showAlertDialog(
              context: context,
              title: 'Auth Error',
              content: state.errorMessage);
        } else if (state is TherapistLoginSuccess) {
          context.read<LoginStatusCubit>().saveLoginStatus(role: "therapist");
        }
      },
      builder: (context, state) {
        if (state is TherapistLoginLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TherapistLoginSuccess) {
          return const TherapistBottomNavigation();
        }
        return Scaffold(
          body: Form(
            key: formKey,
            child: Login(
              emailController: emailController,
              passwordController: passwordController,
              loginButtonOnpressed: () => _onLoginPressed(),
            ),
          ),
        );
      },
    );
  }

  void _onLoginPressed() {
    if (formKey.currentState!.validate()) {
      context.read<TherapistLoginBloc>().add(
            LoginTherapist(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
