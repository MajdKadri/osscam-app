import 'package:dio/dio.dart';
import 'package:project_managment_bloc_riverpod/core/helper/api_helper.dart';

import '../../helper/globals.dart';
import '../models/create_task_model.dart';

class CreateNewTaskService extends Api {
  post(List<TaskModel> tasks) async {
    response = await dio.post(
        'https://projects-management-system.onrender.com/api/v1/tasks',
        data: tasks,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
