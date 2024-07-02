import 'package:clini_dor/models/question.dart';
import 'package:flutter/material.dart';

class OpenQuestion extends StatefulWidget {
  Question question;
  Function registerAnswer;
  String? currentAnswers;
  OpenQuestion({super.key, required this.question, required this.registerAnswer, required this.currentAnswers});

  @override
  State<OpenQuestion> createState() => _OpenQuestionState();
}

class _OpenQuestionState extends State<OpenQuestion> {

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
                  controllers.add(TextEditingController(text: widget.currentAnswers));
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: (
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: controllers[index],
                            onChanged: (value) {
                              setState(() {
                                widget.currentAnswers = value;
                              });
                              List<String> currentValue = [value.toString()];
                              widget.registerAnswer(widget.question.id, currentValue);
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