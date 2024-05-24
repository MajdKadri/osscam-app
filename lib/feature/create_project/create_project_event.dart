part of 'create_project_bloc.dart';

@immutable
abstract class CreateProjectEvent {}

class CreateProject extends CreateProjectEvent {
  ProjectModel projectmodel;

  CreateProject({required this.projectmodel});
}
