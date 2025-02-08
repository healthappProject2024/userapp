part of 'therapist_login_bloc.dart';

@immutable
sealed class TherapistLoginEvent {}

class LoginTherapist extends TherapistLoginEvent {
  final String email;
  final String password;

  LoginTherapist({required this.email, required this.password});
}
