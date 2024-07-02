import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final void Function()? onTap;
  const FloatingButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor:  Theme.of(context).colorScheme.tertiary,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}