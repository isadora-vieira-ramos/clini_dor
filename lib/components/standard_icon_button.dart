import 'package:flutter/material.dart';

class StandardIconButton extends StatelessWidget {
  final double top;
  final double? left;
  final double? right;
  const StandardIconButton({super.key, required this.top, this.left, this.right});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: top, right: right != null? right! : 0, left:left != null? left! : 0),
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          icon: const Icon(Icons.radio_button_checked), 
          color: Colors.grey.shade500, 
          onPressed: () {}
        ),
      ),
    );
  }
}