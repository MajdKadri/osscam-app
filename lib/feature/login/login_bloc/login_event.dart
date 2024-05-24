part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  SignInModel signInModel;

  Login({required this.signInModel});
}
