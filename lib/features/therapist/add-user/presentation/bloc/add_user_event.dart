part of 'add_user_bloc.dart';

@immutable
sealed class AddUserEvent {}

class AdduserTapped extends AddUserEvent {
  final String name;
  final String email;
  final String password;
  final File imagePath;

  AdduserTapped({
    required this.name,
    required this.email,
    required this.imagePath,
    required this.password,
  });
}
