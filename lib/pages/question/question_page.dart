import "package:clini_dor/models/question.dart";
import "package:clini_dor/models/question_type.dart";
import "package:clini_dor/pages/question/closed_question.dart";
import "package:clini_dor/pages/question/front_click_map_question.dart";
import "package:clini_dor/pages/question/back_click_map_question.dart";
import "package:clini_dor/pages/question/medicine_list_question.dart";
import "package:clini_dor/pages/question/medicine_question.dart";
import "package:clini_dor/pages/question/multiple_choice_question.dart";
import "package:clini_dor/pages/question/open_question.dart";
import "package:clini_dor/pages/question/rating_question.dart";
import "package:flutter/material.dart";

class QuestionPage extends StatelessWidget {
  Question question;
  Function registerAnswer;
  String? currentAnswer;
  QuestionPage({super.key, required this.question, required this.registerAnswer, this.currentAnswer});

  @override
  Widget build(BuildContext context) {

    if (question.questionType == QuestionType.open){
      return OpenQuestion(question: question, registerAnswer: registerAnswer, currentAnswers: currentAnswer);
    }
    if(question.questionType == QuestionType.multipleChoice){
      return (MultipleChoiceQuestion(question: question, registerAnswer: registerAnswer, currentAnswers: currentAnswer));
    }
    if(question.questionType == QuestionType.closed){
      return (ClosedQuestion(question: question, registerAnswer: registerAnswer, currentAnswer: currentAnswer));
    }
    if(question.questionType == QuestionType.rating){
      return (
        RatingQuestion(question: question, registerAnswer: registerAnswer, currentSliderValue: double.parse(currentAnswer.toString().isEmpty? "0" : currentAnswer.toString()))
      );
    }
    if(question.questionType == QuestionType.medicine){
      return (
        MedicineListQuestion(question: question, registerAnswer: registerAnswer, currentAnswer: currentAnswer)
      );
    }
    else{
      if(question.options[0] == "ANTERIOR"){
        return (
          FrontClickMapQuestion(question: question, registerAnswer: registerAnswer, currentAnswer: currentAnswer)
        );
      }
      else{
        return (
          BackClickMapQuestion(question: question, registerAnswer: registerAnswer, currentAnswer: currentAnswer)
        );
      }
    }
  }
}