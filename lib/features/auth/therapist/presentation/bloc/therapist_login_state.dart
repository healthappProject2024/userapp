part of 'therapist_login_bloc.dart';

@immutable
sealed class TherapistLoginState {}

final class TherapistLoginInitial extends TherapistLoginState {}

final class TherapistLoginLoading extends TherapistLoginState {}

final class TherapistLoginSuccess extends TherapistLoginState {
  final Therapist therapist;

  TherapistLoginSuccess({required this.therapist});
}

final class TherapistLoginFailure extends TherapistLoginState {
  final String errorMessage;

  TherapistLoginFailure({required this.errorMessage});
}
