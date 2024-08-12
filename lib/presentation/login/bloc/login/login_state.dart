part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}

final class LoginSuccess extends LoginState {
  final String? successMsg;
  final dynamic data;

  LoginSuccess({this.successMsg, this.data});
}

final class LoginLoader extends LoginState {}

final class RememberMeCheckChangedState extends LoginState {}

class RememberMeUserCredentialsEvent extends LoginState {
  final String email;
  final String password;

  RememberMeUserCredentialsEvent({required this.email, required this.password});
}
