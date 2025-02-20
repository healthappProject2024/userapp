part of 'add_user_bloc.dart';

@immutable
sealed class AddUserState {}

final class AddUserInitial extends AddUserState {}

final class AdduserLoading extends AddUserState{}

final class AdduserSuccess extends AddUserState{}

final class AddUserFailure extends AddUserState{
  final String message;

  AddUserFailure({required this.message});
}
