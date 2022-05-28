import 'package:flutter/material.dart';

class CustomConfirmationAlertDialogWidget extends StatelessWidget {
  const CustomConfirmationAlertDialogWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.confirmCallback,
  }) : super(key: key);

  final String title;
  final String message;
  final VoidCallback confirmCallback;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: confirmCallback, child: const Text('Confirm')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
      ],
    );
  }
}
