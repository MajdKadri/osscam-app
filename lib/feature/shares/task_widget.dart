import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/domain/models/create_task_model.dart';
import '../../core/helper/color.dart';
import '../../core/helper/globals.dart';
import '../../main.dart';
import '../add_task/task_bloc.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget(
      {super.key,
      required this.taskText,
      required this.tasks,
      required this.index});

  int index;

  String taskText;
  List<TaskModel> tasks;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 12,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: Slidable(
          startActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  borderRadius: BorderRadius.all(Radius.circular(-12)),
                  onPressed: (context) => {
                        widget.tasks.removeAt(widget.index),
                        context
                            .read<TaskBloc>()
                            .add(DeleteTask(tasks: widget.tasks))
                      },
                  backgroundColor: Colors.red,
                  icon: Icons.delete)
            ],
          ),
          endActionPane: ActionPane(
            motion: BehindMotion(),
            children: [],
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.addTaskCardBackgroudColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Positioned(
                left: 10,
                right: 10,
                top: 20,
                bottom: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 4, right: 4),
                      child: Text(widget.taskText),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
