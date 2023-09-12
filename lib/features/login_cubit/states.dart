part of 'cubit.dart';

class LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{}

class LoginFailedState extends LoginStates{
  final String msg;

  LoginFailedState({required this.msg});
}