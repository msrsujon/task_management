import 'package:flutter/material.dart';

void ShowSnakBarMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('new user registration successful'),
    ),
  );
}

void ShowSnakBarErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('message'),
    ),
  );
}
