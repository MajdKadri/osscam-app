import 'package:flutter_secure_storage/flutter_secure_storage.dart';

String? token;
FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
late double width;
String? projectId;
late double height;
String? userId ;
void initial ()async{
  token = await flutterSecureStorage.read(key: 'token');
  projectId = await flutterSecureStorage.read(key: 'projectid');
  userId = await flutterSecureStorage.read(key: 'userid');
  print(projectId);
  print(token);
}