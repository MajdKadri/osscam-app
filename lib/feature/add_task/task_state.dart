part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class NewTaskAddedSuccessfully extends TaskState {
  List<TaskModel> tasks = [];

  NewTaskAddedSuccessfully({required this.tasks});
}

class TasksPostedSuccessfully extends TaskState {}

class FaildToPostTasks extends TaskState {}

class Loading extends TaskState {}
