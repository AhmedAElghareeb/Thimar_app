part of 'cubit.dart';

class RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{}

class RegisterFailedState extends RegisterStates{
  final String msg;

  RegisterFailedState({required this.msg});
}