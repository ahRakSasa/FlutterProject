import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      action: SnackBarAction(
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        label: "DONE",
      ),
    ),
  );
}