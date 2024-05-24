import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/domain/models/create_task_model.dart';
import '../../core/domain/services/create_new_task_service.dart';


part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    List<TaskModel> tasks = [];
    on<CreateNewTaskEvent>((event, emit) {
      tasks.add(TaskModel(
          taskDescription: event.taskModel.taskDescription,
          projectId: event.taskModel.projectId));
      emit(NewTaskAddedSuccessfully(tasks: tasks));
    });
    on<PostTasks>(
      (event, emit) async {
        emit(Loading());
        var response = await CreateNewTaskService().post(tasks);
        if (response == true) {
          emit(TasksPostedSuccessfully());
        } else {
          emit(FaildToPostTasks());
        }
      },
    );
    on<DeleteTask>((event, emit) {
      emit(NewTaskAddedSuccessfully(tasks: tasks));
    });
  }
}
