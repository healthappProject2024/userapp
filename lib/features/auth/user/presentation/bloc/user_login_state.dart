part of 'user_login_bloc.dart';

@immutable
sealed class UserLoginState {}

final class UserLoginInitial extends UserLoginState {}

final class LoginLoading extends UserLoginState {}

final class UserLoggedIn extends UserLoginState {}

final class UserLogingFirstTime extends UserLoginState {}

final class LoginError extends UserLoginState {
  final String message;

  LoginError({required this.message});
}
