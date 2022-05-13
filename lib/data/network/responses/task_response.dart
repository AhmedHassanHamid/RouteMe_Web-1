import 'package:web/data/models/task_model.dart';

class TaskResponse {
  TaskResponse({
    this.status,
    this.message,
    this.tasks,
  });

  int? status;
  String? message;
  List<TaskModel>? tasks;

  factory TaskResponse.fromJson(Map<String, dynamic> json) => TaskResponse(
    status: json["status"],
    message: json["message"],
    tasks: json["tasks"] != null
        ? List<TaskModel>.from(
        json["tasks"].map((x) => TaskModel.fromJson(x)))
        : json["tasks"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "orders": List<dynamic>.from(tasks!.map((x) => x.toJson())),
  };
}
