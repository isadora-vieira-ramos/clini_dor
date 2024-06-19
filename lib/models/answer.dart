class Answer {
  final int id;
  List<String> pickedAnswers;

  Answer({required this.id, required this.pickedAnswers});

  Map toJson() => {
    id.toString(): pickedAnswers.join(','),
  };
}