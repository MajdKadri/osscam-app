import 'package:dio/dio.dart';

abstract class Api {
  Dio dio = Dio();
  late Response response;
  String baseurl = 'https://projects-management-system.onrender.com/api/v1/';
}
