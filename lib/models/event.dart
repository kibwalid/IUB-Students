class Event {
  String title;
  String date;
  String tag;

  Event({
    required this.title,
    required this.date,
    required this.tag,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      date: json['date'],
      tag: json['tag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'tag': tag,
    };
  }

  String toJsonString() {
    return """{
      'title': '$title',
      'date': '$date',
      'tag': '$tag'
    }"""
        .replaceAll("'", "\"");
  }
}
