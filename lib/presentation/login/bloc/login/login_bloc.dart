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

        DataState response =
            await repository.callLoginApi(apiRequest: event.requestBody);
        if (response is DataSuccess) {
          //MARK: Modify the below conditions according to the response data. The below conditions are sample.
          if (response.data?.status?.text == "OK" &&
              response.data?.status?.errorCode == null) {
            authBloc.add(AppLogin(
                username: event.requestBody.login.email,
                token: response.data?.token?.text ?? ""));
            emit(LoginSuccess(data: response.data));
          } else {
            if (response.data?.status?.errorCode != null) {
              if (response.data?.status?.errorCode == "20") {
                emit(LoginFailure(error: Strings.userDoesntExist));
              } else if (response.data?.status?.errorCode == "21") {
                emit(LoginFailure(error: Strings.invalidCredential));
              } else {
                emit(LoginFailure(error: Strings.serverError));
              }
            } else {
              emit(LoginFailure(error: Strings.serverError));
            }
          }
        } else {
          emit(LoginFailure(error: response.error));
        }
      } catch (e) {
        //TODO: This line is not correct. it just added for testing the login page.
        //When the correct login API available, remove the below line and activate the LoginFailure.
        emit(LoginSuccess(data: ""));

        //emit(LoginFailure(error: Strings.somethingWentWrong)); //TODO: Uncomment this when API Available.
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
