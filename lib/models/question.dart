import 'package:clini_dor/models/question_type.dart';

class Question {
  final String questionText;
  final List<String> answers;
  final QuestionType questionType;
  Question({required this.questionText, required this.answers, required this.questionType});
}