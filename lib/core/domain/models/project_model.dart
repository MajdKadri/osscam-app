class ProjectModel {
  String projectName;
  String projectDescription;
  String? projectStatus;

  ProjectModel({
    required this.projectName,
    required this.projectDescription,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectName'] = this.projectName;
    data['projectDescription'] = this.projectDescription;
    data['projectStatus'] = "NEW";
    return data;
  }
}
