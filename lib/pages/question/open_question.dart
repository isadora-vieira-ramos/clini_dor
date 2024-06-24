import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OpenQuestion extends StatefulWidget {
  Question question;
  Function registerAnswer;
  String? currentAnswers;
  OpenQuestion({super.key, required this.question, required this.registerAnswer, required this.currentAnswers});

  @override
  State<OpenQuestion> createState() => _OpenQuestionState();
}

class _OpenQuestionState extends State<OpenQuestion> {
  List<String> answers = [];

  void registerAnswer(String label, String answer){
    print(widget.currentAnswers);
    if(label.isEmpty){
      if(answers.isEmpty){
        answers.add(answer);
      }else{
        answers[0] = answer;
      }
    }else{
      int index = answers.indexWhere((element) => element.contains(label));
      if(index == -1){
        answers.add("$label:$answer");
      }else{
        answers[index] = "$label:$answer";
      }
    }
    widget.registerAnswer(widget.question.id, answers);
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers = [];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30, left: 30, right: 30),
            child: Text(
              widget.question.questionText,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 20
              )
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: widget.question.options.length,
                itemBuilder: (context, index) {
                  controllers.add(TextEditingController());
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: (
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: widget.question.options[index].isNotEmpty? true: false,
                            child: Text(
                              "${widget.question.options[index]}:",
                              style: const TextStyle(
                                fontSize: 16
                              ),
                            ),
                          ),
                          TextField(
                            controller: controllers[index],
                            onChanged: (value) {
                              registerAnswer(widget.question.options[index], value);
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder()
                            ),
                          ) 
                        ],
                      )
                    ),
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}