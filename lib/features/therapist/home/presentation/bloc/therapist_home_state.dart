part of 'therapist_home_bloc.dart';

@immutable
sealed class TherapistHomeState {}

final class TherapistHomeInitial extends TherapistHomeState {}

class HomeLoading extends TherapistHomeState {}

class HomeLoaded extends TherapistHomeState {
  final List<Users> users;
  final String therapistName;

  HomeLoaded({required this.users,required this.therapistName});
}

class TherapistHomeError extends TherapistHomeState {
  final Failures failure;

  TherapistHomeError(this.failure);
}
