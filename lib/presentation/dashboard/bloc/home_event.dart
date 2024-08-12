part of 'home_bloc.dart';

sealed class HomeEvent {}

class NetworkConnectionStateChangeEvent extends HomeEvent {
  final bool isNetworkConnected;
  NetworkConnectionStateChangeEvent({required this.isNetworkConnected});
}