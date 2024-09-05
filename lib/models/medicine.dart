class Medicine{
  String name;
  int weeklyFrequencyUse;
  int monthlyFrequencyUse;

  Medicine({required this.name, required this.weeklyFrequencyUse, required this.monthlyFrequencyUse});

  Map toJson() => {
    'name': name,
    'weeklyUse': weeklyFrequencyUse,
    'monthlyUse': monthlyFrequencyUse,
  };
}