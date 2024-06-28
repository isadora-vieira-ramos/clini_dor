import 'package:clini_dor/components/standard_icon_button.dart';
import 'package:clini_dor/models/question.dart';
import 'package:clini_dor/pages/question/hand_click_map_question.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FrontClickMapQuestion extends StatefulWidget {
  Question question;
  final Function registerAnswer;
  String? currentAnswer;
  FrontClickMapQuestion({super.key, required this.question, required this.registerAnswer, this.currentAnswer});

  @override
  State<FrontClickMapQuestion> createState() => _FrontClickMapQuestionState();
}

class _FrontClickMapQuestionState extends State<FrontClickMapQuestion> {
  List<String> selectedOptions = [];


  @override
  void initState() {
    if(widget.currentAnswer != null && widget.currentAnswer!.isNotEmpty){
      var savedAnswers = widget.currentAnswer!.split(",");
      for(var element in savedAnswers){
        selectedOptions.add(element);
      }
    }
  }

  void registerPosition(String answer){
    int index = selectedOptions.indexWhere((element) => element.split(":")[0] == answer.split(":")[0]);
    if(index == -1){
      selectedOptions.add(answer);
    }else{
      var paintIntensity = answer.split(":")[1];
      if(paintIntensity.isNotEmpty){
        selectedOptions[index] = answer;
      }else{
        if(answer.contains("hand")){
          selectedOptions.removeWhere((element) => element.contains("joint"));
        }
        selectedOptions.removeAt(index);
      }
    }
    widget.registerAnswer(widget.question.id, selectedOptions);
    showHandDialog(answer);
  }

  void showHandDialog(String painPoint){
    if(painPoint.contains("hand")){
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return HandClickMapQuestion(getCurrentAnswer: getCurrentAnswer, registerAnswer: registerHandPosition);
        }
      );
    }
  }

  void registerHandPosition(String answer){
    int index = selectedOptions.indexWhere((element) => element.split(":")[0] == answer.split(":")[0]);
    if(index == -1){
      selectedOptions.add(answer);
    }else{
      var paintIntensity = answer.split(":")[1];
      if(paintIntensity.isNotEmpty){
        selectedOptions[index] = answer;
      }else{
        selectedOptions.removeAt(index);
      }
    }
    widget.registerAnswer(widget.question.id, selectedOptions);
  }
  

  int getCurrentAnswer(String label){
    if(selectedOptions.isNotEmpty){
      var answer = selectedOptions.where((element) => element.contains(label));
      if(answer.isNotEmpty){
        var painIntensity = answer.toList()[0].split(":")[1];
        if(painIntensity == "moderate"){
          return 1;
        }else{
          return 2;
        }
      }else{
        return 0;
      }
    }else{
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentAnswer);

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
              child: Column(
                children: [
                  Text(
                    widget.question.questionText,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 20
                    )
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.radio_button_checked, color: Colors.yellow.shade800),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Menor intensidade"),
                            )
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.radio_button_checked, color: Colors.red),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Maior intensidade"),
                            )
                          ],
                        ),
                      ]
                    ),
                  ),
                ],
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
                      StandardIconButton(position: "front_center_forehead", top: 10, currentValue: getCurrentAnswer("front_center_forehead"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_jaw", top: 65, left: 50, currentValue: getCurrentAnswer("front_left_jaw"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_jaw", top: 65, right:50, currentValue: getCurrentAnswer("front_right_jaw"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_sternum", top: 130, currentValue: getCurrentAnswer("front_sternum"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_shoulder", top: 130, left: 150, currentValue: getCurrentAnswer("front_left_shoulder"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_shoulder", top: 130, right: 150, currentValue: getCurrentAnswer("front_right_shoulder"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_upper_arm", top: 210, right: 150, currentValue: getCurrentAnswer("front_right_upper_arm"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_upper_arm", top: 210, left: 150, currentValue: getCurrentAnswer("front_left_upper_arm"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_center_abdomen", top: 265, currentValue: getCurrentAnswer("front_center_abdomen"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_forearm", top: 265, left: 170, currentValue: getCurrentAnswer("front_left_forearm"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_forearm", top: 265, right: 170, currentValue: getCurrentAnswer("front_right_forearm"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_hip", top: 310, right: 120, currentValue: getCurrentAnswer("front_right_hip"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_hip", top: 310, left: 120, currentValue: getCurrentAnswer("front_left_hip"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_hand", top: 340, left: 210, currentValue: getCurrentAnswer("front_left_hand"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_hand", top: 340, right: 210, currentValue: getCurrentAnswer("front_right_hand"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_thigh", top: 415, left: 100, currentValue: getCurrentAnswer("front_left_thigh"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_thigh", top: 415, right: 100, currentValue: getCurrentAnswer("front_right_thigh"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_knee", top: 490, right: 90, currentValue: getCurrentAnswer("front_right_knee"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_knee", top: 490, left: 90, currentValue: getCurrentAnswer("front_left_knee"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_shin", top: 565, left: 100, currentValue: getCurrentAnswer("front_left_shin"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_shin", top: 565, right: 100, currentValue: getCurrentAnswer("front_right_shin"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_right_foot", top: 690, right: 100, currentValue: getCurrentAnswer("front_right_foot"), registerAnswer: registerPosition),
                      StandardIconButton(position: "front_left_foot", top: 690, left: 100, currentValue: getCurrentAnswer("front_left_foot"), registerAnswer: registerPosition),
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