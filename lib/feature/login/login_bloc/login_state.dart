part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoggedIn extends LoginState {}

class Loading extends LoginState {}

class ErrorState extends LoginState {}
