import "package:flutter/material.dart";

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Carregando...",
        style: TextStyle(
          fontSize: 20
        ),
      ),
    );
  }
}