import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpenQuestion extends StatefulWidget {
  Question question;
  Function registerAnswer;
  OpenQuestion({super.key, required this.question, required this.registerAnswer});

  @override
  State<OpenQuestion> createState() => _OpenQuestionState();
}

class _OpenQuestionState extends State<OpenQuestion> {
  List<String> answers = [];

  void registerAnswer(String label, String answer){
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: widget.question.options.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: (
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Visibility(
                            child: Text(widget.question.options[index].toString()),
                            visible: widget.question.options[index].toString().isEmpty? false: true,
                          ),
                          TextField(
                            onChanged: (value) {
                              registerAnswer(widget.question.options[index], value);
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
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