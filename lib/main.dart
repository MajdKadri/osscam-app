import 'package:flutter/material.dart';
import 'package:project_managment_bloc_riverpod/feature/login/login_page.dart';

import 'core/helper/globals.dart';
import 'feature/add_task/add_tasks_to_project_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initial();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token != null && projectId != null
            ? AddTasksToProject(id: int.parse(projectId!))
            : SignInPage());
  }
}
