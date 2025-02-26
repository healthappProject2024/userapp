import 'package:flutter/material.dart';

void showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  String confirmText = "OK",
  VoidCallback? onConfirm,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            child: Text(confirmText),
          ),
        ],
      );
    },
  );
}
