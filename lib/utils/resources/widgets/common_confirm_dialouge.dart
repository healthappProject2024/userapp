import 'package:flutter/material.dart';

Future<void> showConfirmDialog({
  required BuildContext context,
  required String heading,
  required String content,
  required String purpose,
  required Function() okPressed,
}) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(heading),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: okPressed,
          child: Text(purpose),
        ),
      ],
    ),
  );
}
