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

  static Exam findClosestExam(List<Exam> exams) {
    DateTime now = DateTime.now();
    Exam closestExam = exams[0];

    for (var exam in exams) {
      Duration difference = exam.startDate.difference(now);
      Duration closestDifference = closestExam.startDate.difference(now);

      if (difference.inSeconds.abs() < closestDifference.inSeconds.abs()) {
        closestExam = exam;
      }
    }

    return closestExam;
  }
}
