import 'package:clini_dor/components/standard_icon_button.dart';
import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class FrontClickMapQuestion extends StatefulWidget {
  Question question;
  final Function registerAnswer;
  FrontClickMapQuestion({super.key, required this.question, required this.registerAnswer});

  @override
  State<FrontClickMapQuestion> createState() => _FrontClickMapQuestionState();
}

class _FrontClickMapQuestionState extends State<FrontClickMapQuestion> {

  List<String> selectedOptions = [];

  void registerPosition(String answer){
    int index = selectedOptions.indexWhere((element) => element == answer);
    if(index == -1){
      selectedOptions.add(answer);
    }else{
      selectedOptions.removeAt(index);
    }
    widget.registerAnswer(widget.question.id, selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                widget.question.questionText,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 20
                )
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Image.asset(widget.question.questionImage.toString(), fit: BoxFit.fill),
                        )
                      ),
                      StandardIconButton(position: "front_center_forehead", top: 10, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_jaw", top: 65, left: 50, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_jaw", top: 65, right:50, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_sternum", top: 130, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_shoulder", top: 130, left: 150,registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_shoulder", top: 130, right: 150, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_upper_arm", top: 210, right: 150, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_upper_arm", top: 210, left: 150, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_center_abdomen", top: 265, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_forearm", top: 265, left: 170, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_forearm", top: 265, right: 170, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_hip", top: 310, right: 120, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_hip", top: 310, left: 120, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_hand", top: 340, left: 210, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_hand", top: 340, right: 210, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_thigh", top: 415, left: 100, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_thigh", top: 415, right: 100, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_knee", top: 490, right: 90, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_knee", top: 490, left: 90, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_shin", top: 565, left: 100, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_shin", top: 565, right: 100, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_foot", top: 690, right: 100, registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_foot", top: 690, left: 100, registerAnswer: registerPosition),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}