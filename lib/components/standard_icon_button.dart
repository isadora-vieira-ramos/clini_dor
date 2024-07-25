import 'package:flutter/material.dart';

class StandardIconButton extends StatefulWidget {
  final Function registerAnswer;
  final double top;
  final String? position;
  final double? left;
  final double? right;
  int? currentValue;
  StandardIconButton({super.key, required this.top, this.position, this.left, this.right, required this.registerAnswer, this.currentValue});

  @override
  State<StandardIconButton> createState() => _StandardIconButtonState();
}

class _StandardIconButtonState extends State<StandardIconButton> {

  changeValue(){
    if(widget.currentValue == 2){
      widget.currentValue = 0;
    }else{
      widget.currentValue = widget.currentValue! + 1;
    }
  }

  String getSubtitle(){
    if(widget.currentValue == 0){
      return "";
    }
    else if(widget.currentValue == 1){
      return "moderate";
    }else{
      return "acute";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.top, right: widget.right != null? widget.right! : 0, left:widget.left != null? widget.left! : 0),
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          icon: const Icon(Icons.radio_button_checked), 
          color: widget.currentValue == 0? Colors.grey.shade500: (widget.currentValue == 1? Colors.yellow.shade600: Colors.red),
          onPressed: (){
            setState(()
            {
              changeValue();
              widget.registerAnswer("${widget.position}:${getSubtitle()}");
            });                    
          }
        ),
      ),
    );
  }
}