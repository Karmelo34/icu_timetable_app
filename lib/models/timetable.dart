class TimeSlot {
  final String id;
  final String subject;
  final String lecturer;
  final String room;
  final String day;
  final String startTime;
  final String endTime;
  final String courseCode;

  TimeSlot({
    required this.id,
    required this.subject,
    required this.lecturer,
    required this.room,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.courseCode,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      id: json['id'],
      subject: json['subject'],
      lecturer: json['lecturer'],
      room: json['room'],
      day: json['day'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      courseCode: json['course_code'],
    );
  }
}
