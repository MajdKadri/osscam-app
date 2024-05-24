import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/domain/models/project_model.dart';
import '../../core/helper/color.dart';
import '../../core/helper/globals.dart';
import '../../core/helper/images.dart';
import '../../core/helper/strings.dart';
import '../../main.dart';
import '../add_task/add_tasks_to_project_page.dart';
import '../shares/app_main_button.dart';
import 'create_project_bloc.dart';

class CreateProjectPage extends StatefulWidget {
  CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  TextEditingController projectnameContoller = TextEditingController();
  TextEditingController projectscriptContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProjectBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: CustomColors.backgroundColor,
          body: SingleChildScrollView(
            child: SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: width / 5,
                        height: height / 6,
                        child: CustomImages.appLogo),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      child: Text(
                        CustomStrings.projectName,
                        style: TextStyle(
                            color: Color(0xffCFD6E9),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextField(
                      controller: projectnameContoller,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      child: Text(
                        CustomStrings.projectScript,
                        style: TextStyle(
                            color: Color(0xffCFD6E9),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      child: TextField(
                        maxLines: 15,
                        controller: projectscriptContoller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Center(
                        child:
                            BlocConsumer<CreateProjectBloc, CreateProjectState>(
                                listener: (context, state) {
                      if (state is Loading) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.orange,
                            content: Text('Loading')));
                      } else if (state is Error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Error')));
                      } else if (state is Success) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Success')));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              settings: RouteSettings(),
                              builder: (context) =>
                                  AddTasksToProject(id: state.id),
                            ));
                      }
                    }, builder: (context, state) {
                      if (state is CreateProjectInitial) {
                        return AppMainButton(
                            buttontext: CustomStrings.create,
                            onPressed: () {
                              context.read<CreateProjectBloc>().add(
                                  CreateProject(
                                      projectmodel: ProjectModel(
                                          projectDescription:
                                              projectscriptContoller.text,
                                          projectName:
                                              projectnameContoller.text)));
                            });
                      } else if (state is Loading) {
                        return CircularProgressIndicator();
                      } else {
                        return Container();
                      }
                    })),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
