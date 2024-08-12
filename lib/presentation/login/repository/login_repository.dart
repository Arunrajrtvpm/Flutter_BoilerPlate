import '../../../data/datasource/remote/network_config.dart';
import '../../../data/datasource/remote/remote_datasource.dart';
import '../../../data/model/base_class/response_base_class.dart';
import '../../../data/model/login/request/login_request.dart';
import '../../../data/model/login/response/login_response.dart';
import '../../../utils/constants/enums.dart';

class LoginRepository {
  RemoteDataSource datasource;

  LoginRepository({required this.datasource});

  callLoginApi({required LoginRequest apiRequest}) async {
    var response = await datasource.connectRemoteService(
        endpoint: NetworkConfig.login,
        method: ApiMethod.post,
        requestBody: apiRequest);
    if (response is DataSuccess) {
      return DataSuccess(LoginResponse.fromJson(response.data));
    } else {
      return DataFailure(response.error);
    }
  }
}
