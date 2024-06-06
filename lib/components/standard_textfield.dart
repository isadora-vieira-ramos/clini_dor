import 'package:flutter/material.dart';

class StandardTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Function()? onTap;
  final bool? enabled;
  const StandardTextfield({super.key, required this.controller, required this.hintText, required this.obscureText, this.onTap, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText
        ),
        onTap: onTap,
        obscureText: obscureText,
        enabled: enabled,
      ),
    );
  }
}
