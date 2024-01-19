class Exam {
  String title;
  String date;
  DateTime startDate;

  Exam({
    required this.title,
    required this.date,
    required this.startDate,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      title: json['title'],
      date: json['date'],
      startDate: DateTime.parse(json['startDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'startDate': startDate.toUtc().toIso8601String(),
    };
  }

  String toJsonString() {
    return """{
      'title': '$title',
      'date': '$date',
      'startDate': '${startDate.toUtc().toIso8601String()}'
    }"""
        .replaceAll("'", "\"");
  }
}
