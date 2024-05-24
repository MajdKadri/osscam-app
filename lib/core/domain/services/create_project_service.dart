import 'package:dio/dio.dart';
import 'package:project_managment_bloc_riverpod/core/helper/globals.dart';
import 'package:project_managment_bloc_riverpod/core/domain/models/result_error_model.dart';
import 'package:project_managment_bloc_riverpod/core/helper/api_helper.dart';
import 'package:project_managment_bloc_riverpod/core/helper/endpoints.dart';

import '../models/project_model.dart';

class ProjectService extends Api {
  Future<ResultModel> createProject(ProjectModel projectModel) async {
    response = await dio.post(baseurl + Endpoints.projects,
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: projectModel.toJson());
    if (response.statusCode == 200) {
      return ProjectIdModel(id: response.data['id']);
    } else
      return ErrorModel(error: 'error');
  }
}
