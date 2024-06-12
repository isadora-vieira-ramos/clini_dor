import "package:clini_dor/models/question.dart";
import "package:clini_dor/models/question_type.dart";
import "package:clini_dor/pages/question/closed_question.dart";
import "package:clini_dor/pages/question/front_click_map_question.dart";
import "package:clini_dor/pages/question/back_click_map_question.dart";
import "package:clini_dor/pages/question/multiple_choice.dart";
import "package:clini_dor/pages/question/rating_question.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class QuestionPage extends StatelessWidget {
  Question question;
  QuestionPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    if (question.questionType == QuestionType.open){
      return (
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  question.questionText,
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
                    itemCount: question.answers.length,
                    itemBuilder: (context, index) {
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
                  ),
                ),
              )
            ],
          ),
        )
      );
    }
    if(question.questionType == QuestionType.multipleChoice){
      return (MultipleChoiceQuestion(question: question));
    }
    if(question.questionType == QuestionType.closed){
      return (ClosedQuestion(question: question));
    }
    if(question.questionType == QuestionType.rating){
      return (
        RatingQuestion(question: question)
      );
    }
    else{
      if(question.answers[0] == "FRENTE"){
        return (
          FrontClickMapQuestion(question: question)
        );
      }
      else{
        return (
          BackClickMapQuestion(question: question)
        );
      }
    }
  }
}