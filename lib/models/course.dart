class Course {
  String code;
  String name;
  String sec;
  String room;
  String attendance;
  String grade;
  String startTime;
  String endTime;

  Course({
    required this.code,
    required this.name,
    required this.sec,
    required this.room,
    required this.attendance,
    required this.grade,
    required this.startTime,
    required this.endTime,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      code: json['code'],
      name: json['name'],
      sec: json['sec'],
      room: json['room'],
      attendance: json['attendance'],
      grade: json['grade'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'sec': sec,
      'room': room,
      'attendance': attendance,
      'grade': grade,
      'start_time': startTime,
      'end_time': endTime,
    };
  }

  String toJsonString() {
    return """{
      'code': '$code',
      'name': '$name',
      'sec': '$sec',
      'room': '$room',
      'attendance': '$attendance',
      'grade': '$grade',
      'start_time': '$startTime',
      'end_time': '$endTime'
    }"""
        .replaceAll("'", "\"");
  }
}
