import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  void Function()? onTap;
  FloatingButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor:  Theme.of(context).colorScheme.tertiary,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}