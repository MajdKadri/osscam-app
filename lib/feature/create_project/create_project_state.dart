part of 'create_project_bloc.dart';

@immutable
abstract class CreateProjectState {}

class CreateProjectInitial extends CreateProjectState {}

class Success extends CreateProjectState {
  int id;

  Success({required this.id});
}

class Error extends CreateProjectState {
  String errorMessage;

  Error({required this.errorMessage});
}

class Loading extends CreateProjectState {}
