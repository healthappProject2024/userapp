import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/therapist/therapist_message/presentation/bloc/fetch_message_dart_bloc.dart';
import 'package:userapp/features/therapist/therapist_message/presentation/widgets/message_box.dart';
import 'package:userapp/features/therapist/therapist_message/presentation/widgets/message_error_widget.dart';
import 'package:userapp/utils/resources/widgets/common_appbar.dart';

class TherapistMessagePage extends StatelessWidget {
  const TherapistMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FetchMessageDartBloc>().add(FetchTheMessages());
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Message',
      ),
      body: BlocBuilder<FetchMessageDartBloc, FetchMessageDartState>(
        builder: (context, state) {
          if (state is MessageLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MessageFetched) {
            if (state.messages.isEmpty) {
              return Center(
                child: Text("No message yet"),
              );
            }
            return MessageBox(messageList: state.messages);
          } else if (state is MessageFetchFailed) {
            return MessageErrorWidget(errorMessage: state.errorMessage);
          }
          return MessageErrorWidget(
            errorMessage: "There is an unexcepted issue",
          );
        },
      ),
    );
  }
}
