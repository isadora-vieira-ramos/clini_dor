import "package:clini_dor/models/question.dart";
import "package:flutter/material.dart";

class QuestionPage extends StatelessWidget {
  Question question;
  QuestionPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(question.questionText),
          Expanded(
            child: ListView.builder(
              itemCount: question.answers.length,
              itemBuilder: (context, index) {
                return Text(question.answers[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}