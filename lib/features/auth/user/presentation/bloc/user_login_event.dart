part of 'user_login_bloc.dart';

@immutable
sealed class UserLoginEvent {}

class UserLogingIn extends UserLoginEvent{
  final String email;
  final String password;

  UserLogingIn({required this.email, required this.password});
}