part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class AppLogin extends AuthenticationEvent {
  final String username;
  final String token;

  AppLogin({required this.username, required this.token});
}

class AppLogout extends AuthenticationEvent {}
