import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/therapist/therapist_message/domain/entity/message.dart';
import 'package:userapp/features/therapist/therapist_message/domain/usecase/fetch_message_usecase.dart';

part 'fetch_message_dart_event.dart';
part 'fetch_message_dart_state.dart';

class FetchMessageDartBloc
    extends Bloc<FetchMessageEvent, FetchMessageDartState> {
  final FetchMessageUsecase _fetchMessageUsecase;

  FetchMessageDartBloc({required FetchMessageUsecase fetchMessageUsecase})
      : _fetchMessageUsecase = fetchMessageUsecase,
        super(FetchMessageDartInitial()) {
    on<FetchTheMessages>((event, emit) async {
      emit(MessageLoading());
      final res = await _fetchMessageUsecase();
      res.fold(
        (failure) => emit(
          MessageFetchFailed(errorMessage: failure.message),
        ),
        (messageList) => emit(
          MessageFetched(messages: messageList),
        ),
      );
    });
  }
}
