class Answer {
  final int id;
  List<String> pickedAnswers;

  Answer({required this.id, required this.pickedAnswers});

  factory Answer.fromJson(Map<String, dynamic> answer){
    return Answer(
      id: int.parse(answer.keys.first),
      pickedAnswers: answer.values.first.toString().split(",")
    );
  }

  Map toJson() => {
    id.toString(): pickedAnswers.join(','),
  };
}