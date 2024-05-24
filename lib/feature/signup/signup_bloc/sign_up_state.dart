part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class LoadingStateSignup extends SignUpState {}

class SuccessStateSignup extends SignUpState {}

class ErrorStateSignup extends SignUpState {}
