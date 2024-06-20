import 'package:flutter/material.dart';

class StandardIconButton extends StatefulWidget {
  final Function registerAnswer;
  final double top;
  final String? position;
  final double? left;
  final double? right;
  const StandardIconButton({super.key, required this.top, this.position, this.left, this.right, required this.registerAnswer});

  @override
  State<StandardIconButton> createState() => _StandardIconButtonState();
}

class _StandardIconButtonState extends State<StandardIconButton> {
  int value = 0;

  changeValue(){
    if(value == 2){
      value = 0;
    }else{
      value++;
    }
  }

  String getSubtitle(){
    if(value == 0){
      return "";
    }
    else if(value == 1){
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
          color: value == 0? Colors.grey.shade500: (value == 1? Colors.yellow.shade800: Colors.red),
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