import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/domain/models/create_task_model.dart';
import '../../core/helper/color.dart';
import '../../core/helper/globals.dart';
import '../../core/helper/images.dart';
import '../../core/helper/strings.dart';
import '../../feature/add_task/task_bloc.dart';
import '../../main.dart';
import '../shares/app_main_button.dart';
import '../shares/task_widget.dart';
import '../show_project_page.dart';

class AddTasksToProject extends StatelessWidget {
  AddTasksToProject({super.key, required this.id});

  TextEditingController taskcontroller = TextEditingController();

  int id;

  @override
  Widget build(BuildContext context) {
    print(id.toString());
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: CustomColors.backgroundColor,
          body: SingleChildScrollView(
              child: SizedBox(
                  width: width,
                  height: height * 1.1,
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
                              padding: const EdgeInsets.only(left: 18),
                              child: Text(
                                CustomStrings.tasks,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: width / 1.7,
                                  height: height / 10,
                                  child: Card(
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: CustomColors
                                                  .addTaskCardBackgroudColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        Positioned(
                                          left: 10,
                                          right: 10,
                                          top: 20,
                                          bottom: 10,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 4, right: 4),
                                                child: TextFormField(
                                                  controller: taskcontroller,
                                                  maxLines: 5,
                                                  textAlignVertical:
                                                      TextAlignVertical.top,
                                                  decoration: null,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                BlocListener<TaskBloc, TaskState>(
                                  listener: (context, state) {
                                    if (state is NewTaskAddedSuccessfully) {}
                                  },
                                  child: InkWell(
                                      onTap: (() {
                                        context.read<TaskBloc>().add(
                                            CreateNewTaskEvent(
                                                taskModel: TaskModel(
                                                    projectId: id,
                                                    taskDescription:
                                                        taskcontroller.text)));

                                        taskcontroller.clear();
                                      }),
                                      child: SizedBox(
                                        child: CustomImages.addIcon,
                                        height: height / 20,
                                        width: width / 10,
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width / 7),
                              child: SizedBox(
                                  height: height / 1.5,
                                  width: width / 1.75,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height / 2,
                                        child:
                                            BlocConsumer<TaskBloc, TaskState>(
                                          listener: (context, state) {},
                                          builder: (context, state) {
                                            if (state is TaskInitial) {
                                              return Container();
                                            } else if (state
                                                is NewTaskAddedSuccessfully) {
                                              return ListView.builder(
                                                itemCount: state.tasks.length,
                                                itemBuilder: (context, index) =>
                                                    Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 100),
                                                  child: TaskWidget(
                                                    index: index,
                                                    tasks: state.tasks,
                                                    taskText: state.tasks[index]
                                                        .taskDescription,
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Container();
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child:
                                            BlocConsumer<TaskBloc, TaskState>(
                                          listener: (context, state) {
                                            if (state is Loading) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.orange,
                                                      content:
                                                          Text('Loading')));
                                            } else if (state
                                                is FaildToPostTasks) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text('Error')));
                                            } else if (state
                                                is TasksPostedSuccessfully) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      content:
                                                          Text('Success')));
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowProject(),
                                                  ));
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state is TaskInitial ||
                                                state
                                                    is NewTaskAddedSuccessfully) {
                                              return AppMainButton(
                                                  buttontext:
                                                      CustomStrings.create,
                                                  onPressed: () {
                                                    context
                                                        .read<TaskBloc>()
                                                        .add(PostTasks());
                                                  });
                                            } else if (state is Loading) {
                                              return CircularProgressIndicator();
                                            } else {
                                              return Container();
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ])))),
        );
      }),
    );
  }
}
