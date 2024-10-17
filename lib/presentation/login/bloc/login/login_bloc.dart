import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../data/model/base_class/response_base_class.dart';
import '../../../../data/model/login/request/login_request.dart';
import '../../../../utils/constants/string_constants.dart';
import '../../repository/login_repository.dart';
import '../authentication/authentication_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;
  AuthenticationBloc authBloc;

  LoginBloc({required this.repository, required this.authBloc})
      : super(LoginInitial()) {
    on<InititateLoginEvent>((event, emit) async {
      try {
        emit(LoginLoader());

        //For testing purpose only- emitting the LoginSuccess
        emit(LoginSuccess(data: "Login Success"));

        //MARK:Enable the below code when proper API and Server setup available.
        /*DataState response =
            await repository.callLoginApi(apiRequest: event.requestBody);

        if (response is DataSuccess) {
          //MARK: Modify the below conditions according to the response data.
          //The below conditions are sample.
          authBloc.add(AppLogin(
              username: event.requestBody.login.email,
              token: response.data?.token?.text ?? ""));
          emit(LoginSuccess(data: response.data));
        } else {
          emit(LoginFailure(error: response.error));
        }*/
      } catch (e) {
        emit(LoginFailure(error: Strings.somethingWentWrong));
      }
    });

    on<RememberMeCheckChangedEvent>((event, emit) {
      emit(RememberMeCheckChangedState());
    });

    on<RememberMeEnabledStatusEvent>((event, emit) {
      if (event.isEnabled) {
        emit(RememberMeUserCredentialsEvent(
            email: event.email, password: event.password));
      }
    });
  }
}
