part of 'fetch_message_dart_bloc.dart';

@immutable
sealed class FetchMessageDartState {}

final class FetchMessageDartInitial extends FetchMessageDartState {}

final class MessageLoading extends FetchMessageDartState {}

final class MessageFetched extends FetchMessageDartState {
  final List<Message> messages;

  MessageFetched({required this.messages});
}

final class MessageFetchFailed extends FetchMessageDartState{
  final String errorMessage;

  MessageFetchFailed({required this.errorMessage});
}