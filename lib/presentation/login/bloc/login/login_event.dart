part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class InititateLoginEvent extends LoginEvent {
  final  LoginRequest requestBody;

  InititateLoginEvent({required this.requestBody});
}

class RememberMeCheckChangedEvent extends LoginEvent {}

class RememberMeEnabledStatusEvent extends LoginEvent {
  final bool isEnabled;
  final String email;
  final String password;

  RememberMeEnabledStatusEvent(
      {required this.isEnabled, required this.email, required this.password});
}
