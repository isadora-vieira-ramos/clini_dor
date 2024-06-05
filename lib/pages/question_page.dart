import "package:clini_dor/models/question.dart";
import "package:clini_dor/models/question_type.dart";
import "package:clini_dor/pages/click_map_question.dart";
import "package:clini_dor/pages/rating_question.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionPage extends StatelessWidget {
  Question question;
  QuestionPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    if (question.questionType == QuestionType.open || question.questionType == QuestionType.closed || question.questionType == QuestionType.multipleChoice){
      return (
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                question.questionText,
                style: const TextStyle(
                  fontSize: 20
                )
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: question.answers.length,
                  itemBuilder: (context, index) {
                    if(question.questionType == QuestionType.closed) {
                      return (
                        RadioListTile(
                          value: false, 
                          groupValue: question.answers[index], 
                          onChanged: (newValue) {},
                          title: Text(question.answers[index]),
                        )
                      );
                    }
                    if(question.questionType == QuestionType.multipleChoice){
                      return (
                        CheckboxListTile(
                          value: false, 
                          onChanged: (newValue) {},
                          title: Text(question.answers[index]),
                        )
                      );
                    }
                    if(question.questionType == QuestionType.open){
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: (
                          TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: question.answers[index],
                            ),
                          )
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        )
      );
    }
    if(question.questionType == QuestionType.rating){
      return (
        RatingQuestion(question: question)
      );
    }
    else{
      return (
        ClickMapQuestion(question: question)
      );
    }
  }
}