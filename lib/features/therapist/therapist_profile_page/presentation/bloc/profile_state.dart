part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileFetched extends ProfileState {
  final ProfileUser profile;

  ProfileFetched(this.profile);
}

final class ProfileFetchError extends ProfileState {
  final String errorMessage;

  ProfileFetchError({required this.errorMessage});
}

final class LogOutSuccess extends ProfileState {}

final class LogOutFailedError extends ProfileState {
  final String message;

  LogOutFailedError({required this.message});
}
