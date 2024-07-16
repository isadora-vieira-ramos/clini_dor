import 'package:flutter/material.dart';

class NoItemsMessage extends StatelessWidget {
  String message;
  NoItemsMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18
        ),
      ),
    );
  }
}