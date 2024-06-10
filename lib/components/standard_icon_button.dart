import 'package:flutter/material.dart';

class StandardIconButton extends StatefulWidget {
  final double top;
  final double? left;
  final double? right;
  const StandardIconButton({super.key, required this.top, this.left, this.right});

  @override
  State<StandardIconButton> createState() => _StandardIconButtonState();
}

class _StandardIconButtonState extends State<StandardIconButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.top, right: widget.right != null? widget.right! : 0, left:widget.left != null? widget.left! : 0),
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          icon: const Icon(Icons.radio_button_checked), 
          color: isPressed?  Colors.red: Colors.grey.shade500,
          onPressed: (){
            setState(()
            {
              isPressed = true;
            });                    
          }
        ),
      ),
    );
  }
}