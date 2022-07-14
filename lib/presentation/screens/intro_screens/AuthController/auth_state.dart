part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignOutLoading extends AuthState {}

class SignOutSuccess extends AuthState {}

class SignOutFailed extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailedState extends AuthState {
  final String msg;

  LoginFailedState({required this.msg});
}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailedState extends AuthState {
  final String msg;

  SignUpFailedState({required this.msg});
}
