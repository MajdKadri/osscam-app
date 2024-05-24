import 'package:project_managment_bloc_riverpod/core/domain/models/result_error_model.dart';
import 'package:project_managment_bloc_riverpod/core/domain/models/signup_model.dart';
import 'package:project_managment_bloc_riverpod/core/helper/endpoints.dart';

import '../../helper/api_helper.dart';

class SignUpService extends Api {
  Future<ResultModel> singUp(SignupModel signup) async {
    response = await dio.post(baseurl + Endpoints.signupEndpoint,
        data: signup.toJson());

    if (response.statusCode == 200) {
      return TokenModel(token: response.data["access_token"]);
    } else {
      return ErrorModel(error: '');
    }
  }
}
