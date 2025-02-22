part of 'login_status_cubit.dart';

@immutable
sealed class LoginStatusState {}

final class LoginStatusInitial extends LoginStatusState {}

final class LoginStatusLoaded extends LoginStatusState {
  final bool isLoggedIn;
  final String role;

  LoginStatusLoaded({required this.isLoggedIn, required this.role});
}

final class LoginStatusError extends LoginStatusState {
  final String message;

  LoginStatusError({required this.message});
}
