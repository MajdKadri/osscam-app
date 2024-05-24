class ResultModel {}

class TokenModel extends ResultModel {
  String? token;

  TokenModel({
    this.token,
  });
}

class ErrorModel extends ResultModel {
  String error;

  ErrorModel({
    required this.error,
  });
}

class ProjectIdModel extends ResultModel {
  int id;

  ProjectIdModel({required this.id});
}
class LogoutSuccess extends ResultModel{

}
