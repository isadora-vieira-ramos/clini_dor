class Medicine{
  String name;
  int weeklyFrequencyUse;
  int monthlyFrequencyUse;

  Medicine({required this.name, required this.weeklyFrequencyUse, required this.monthlyFrequencyUse});

  factory Medicine.fromJson(Map<String, dynamic> json){
    return Medicine(
      name: json["name"], 
      weeklyFrequencyUse: json["weeklyUse"], 
      monthlyFrequencyUse: json["monthlyUse"]
    );
  }

  Map toJson() => {
    'name': name,
    'weeklyUse': weeklyFrequencyUse,
    'monthlyUse': monthlyFrequencyUse,
  };
}