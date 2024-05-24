part of 'logout_bloc.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}
class Success extends LogoutState{

}
class Error extends LogoutState{}