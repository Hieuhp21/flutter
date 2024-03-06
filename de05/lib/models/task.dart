class Task {
  String name;
  String dateTime;
  String priority;
  bool isCompleted;

  Task({required this.name, required this.dateTime, required this.priority, this.isCompleted = false});
}