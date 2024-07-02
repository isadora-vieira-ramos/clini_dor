import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class MultipleChoiceQuestion extends StatefulWidget {
  final Question question;
  final Function registerAnswer;
  String? currentAnswers;
  MultipleChoiceQuestion({super.key, required this.question, required this.registerAnswer, required this.currentAnswers});

  @override
  State<MultipleChoiceQuestion> createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {

  Map<String, bool> options = {};
  List<String> selectedOptions = [];

  void updateSelectedOptions(String key, bool value){
    int index = selectedOptions.indexOf(key);
    if(index == -1){
      selectedOptions.add(key);
    }else{
      selectedOptions.removeAt(index);
    }
    widget.registerAnswer(widget.question.id, selectedOptions);
  }

  @override
  void initState() {
    super.initState();
    options = { for (var element in widget.question.options) element : widget.currentAnswers.toString().contains(element)};
    var lastSelected = options.entries.toList().where((x) => x.value == true).toList();
    for(var element in lastSelected){
      selectedOptions.add(element.key);
    }
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80, top: 20, left: 20, right: 20),
                child: ListView(
                  children: options.keys.map((String key) {
                    return CheckboxListTile(
                      title: Text(
                        key, 
                        style: const TextStyle(
                          fontSize: 16
                        ) 
                      ),
                      value: options[key],
                      onChanged: (bool? value) {
                        setState(() {
                          options[key] = value!;
                          updateSelectedOptions(key, value);
                        });
                      },
                    );
                  }).toList(),
                ),
              )
            )
          ],
        ),
      )
    );
  }
}