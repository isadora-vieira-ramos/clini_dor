import 'package:clini_dor/models/question_type.dart';

class Question {
  final int id;
  final String questionText;
  final List<String> options;
  final QuestionType questionType;
  final String? questionImage;
  Question({required this.id, required this.questionText, required this.options, required this.questionType, this.questionImage});
}