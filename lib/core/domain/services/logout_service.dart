import 'package:dio/dio.dart';
import 'package:project_managment_bloc_riverpod/core/domain/models/result_error_model.dart';
import 'package:project_managment_bloc_riverpod/core/helper/endpoints.dart';
import 'package:project_managment_bloc_riverpod/core/helper/globals.dart';

import '../../helper/api_helper.dart';

class LogoutService extends Api{

  Future<ResultModel> logout () async{
    response = await dio.put(baseurl+Endpoints.logoutEndpoint,options: Options(headers: {
      'Authorization':'Bearer $token'
    }));
    if (response.statusCode==200){
      return LogoutSuccess();
    }else return ErrorModel(error: 'error');
  } 
  
}