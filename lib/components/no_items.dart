import 'package:flutter/material.dart';

class NoItemsMessagem extends StatelessWidget {
  String message;
  NoItemsMessagem({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        fontSize: 18
      ),
    );
  }
}