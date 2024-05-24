part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class CreateNewTaskEvent extends TaskEvent {
  TaskModel taskModel;

  CreateNewTaskEvent({required this.taskModel});
}

class PostTasks extends TaskEvent {}

class DeleteTask extends TaskEvent {
  List<TaskModel> tasks;

  DeleteTask({required this.tasks});
}
