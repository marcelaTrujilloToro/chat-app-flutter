import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showAlert({
  required BuildContext context,
  required String title,
  required String subtitle,
}) {
  if (Platform.isAndroid) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            elevation: 5,
            textColor: Colors.blue,
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }

  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        )
      ],
    ),
  );
}
