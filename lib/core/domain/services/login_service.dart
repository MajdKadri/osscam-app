import 'package:project_managment_bloc_riverpod/core/domain/models/result_error_model.dart';
import 'package:project_managment_bloc_riverpod/core/domain/models/signin_model.dart';
import 'package:project_managment_bloc_riverpod/core/helper/api_helper.dart';
import 'package:project_managment_bloc_riverpod/core/helper/endpoints.dart';

class LoginService extends Api {
  Future<ResultModel> login(SignInModel signin) async {
    response = await dio.post(baseurl+Endpoints.signinEndpoint, data: signin.toJson());
    if (response.statusCode == 200) {
      return TokenModel(token: response.data["access_token"]);
    } else {
      return ErrorModel(error: 'error');
    }
  }
}
