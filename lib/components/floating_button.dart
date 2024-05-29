import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor:  Theme.of(context).colorScheme.tertiary,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}