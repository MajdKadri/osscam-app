class TaskModel {
  String taskDescription;
  int projectId;
  String? taskStatus;

  TaskModel({
    required this.taskDescription,
    required this.projectId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskDescription'] = this.taskDescription;
    data['project_id'] = this.projectId;
    data['taskStatus'] = "NEW";
    return data;
  }
}
