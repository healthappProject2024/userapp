part of 'fetch_message_dart_bloc.dart';

@immutable
sealed class FetchMessageEvent {}


final class FetchTheMessages extends FetchMessageEvent{}