part of 'therapist_home_bloc.dart';

@immutable
sealed class TherapistHomeEvent {}

class GetTherapistNameEvent extends TherapistHomeEvent {}

class LoadHome extends TherapistHomeEvent {}

class SearchUserEvent extends TherapistHomeEvent {
  final String query;

  SearchUserEvent(this.query);
}
