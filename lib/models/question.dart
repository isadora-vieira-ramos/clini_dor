import 'package:clini_dor/models/question_type.dart';

class Question {
  final String questionText;
  final List<String> answers;
  final QuestionType questionType;
  final String? questionImage;
  Question({required this.questionText, required this.answers, required this.questionType, this.questionImage});
}