part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUp extends SignUpEvent {
  SignupModel signupModel;

  SignUp({required this.signupModel});
}
