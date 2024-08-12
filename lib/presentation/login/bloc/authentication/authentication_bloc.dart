import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../utils/helper_class/event_bus.dart';
import '../../repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository repository;

  AuthenticationBloc({required this.repository})
      : super(AuthenticationInitial()) {
    EventBusListener().on<LogoutEventBus>().listen((event) {
      add(AppLogout());
    });
    on<AppStarted>((event, emit) async {
      if (await repository.hasToken()) {
        emit(AuthenticationSuccess());
      } else {
        emit(AuthenticationFailure());
      }
    });
    on<AppLogin>((event, emit) async {
      await repository.saveToken(event.username, event.token);
      emit(UserCredentialsSavedonStorage());
    });
    on<AppLogout>((event, emit) async {
      await repository.clearStorage();
      emit(UserLogoutFromAppState());
    });
  }
}
