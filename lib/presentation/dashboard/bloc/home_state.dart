part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

class NetworkConnectionChangeState extends HomeState {
  final bool isNetworkConnected;

  NetworkConnectionChangeState({required this.isNetworkConnected});
}
