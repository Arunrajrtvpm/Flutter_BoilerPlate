import 'package:bloc/bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    on<NetworkConnectionStateChangeEvent>((event, emit) {
      emit(NetworkConnectionChangeState(
          isNetworkConnected: event.isNetworkConnected));
    });
  }
}

