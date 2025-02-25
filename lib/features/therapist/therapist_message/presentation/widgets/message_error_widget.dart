import 'package:flutter/material.dart';

class MessageErrorWidget extends StatelessWidget {
  final String errorMessage;
  const MessageErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorMessage),
      ),
    );
  }
}
