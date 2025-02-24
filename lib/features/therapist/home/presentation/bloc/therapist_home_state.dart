part of 'therapist_home_bloc.dart';

@immutable
sealed class TherapistHomeState {}

final class TherapistHomeInitial extends TherapistHomeState {}

class TherapistNameLoaded extends TherapistHomeState {
  final String therapistName;

  TherapistNameLoaded(this.therapistName);
}

class UsersLoading extends TherapistHomeState {}

class UsersLoaded extends TherapistHomeState {
  final List<Users> users;

  UsersLoaded(this.users);
}

class TherapistHomeError extends TherapistHomeState {
  final Failures failure;

  TherapistHomeError(this.failure);
}
