import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/helper_class/connectivity_helper.dart';
import '../../../utils/helper_class/event_bus.dart';
import '../../model/base_class/failure.dart';
import '../../model/base_class/response_base_class.dart';

class RemoteDataSource {
  Dio dio;
  ConnectivityCheckerHelper connectivityHelper;

  RemoteDataSource({required this.dio, required this.connectivityHelper});

  connectRemoteService<T, Q>(
      {required endpoint,
      required ApiMethod method,
      T? requestBody,
      queryParameters}) async {
    if (await ConnectivityCheckerHelper.checkConnectivity()) {
      try {
        Response response = await dio.request(endpoint,
            data: requestBody, options: Options(method: method.name));
        return validateResponse(response);
      } on TokenException {
        EventBusListener().fire(LogoutEventBus());
        return DataFailure("token expired");
      } on DioException catch (dioException) {
        return DataFailure(dioException.message ?? "");
      } catch (e) {
        return DataFailure("$e");
      }
    } else {
      return DataFailure(Strings.noInternetConnectionMsg);
    }
  }

  DataState validateResponse(Response response) {
    if (response.statusCode == 200) {
      var data = jsonDecode(response.data);
      if (checkIfTokenExpired(data)) {
        throw TokenException();
      } else {
        return DataSuccess(data);
      }
    } else if (response.statusCode == 403 || response.statusCode == 401) {
      return DataFailure(Strings.authError);
    } else {
      return DataFailure(Strings.serverError);
    }
  }

  //Modify this According to the Token in your project
  bool checkIfTokenExpired(data) {
    if (data is Map) {
      if (data.containsKey("Status")) {
        if (data["Status"] is Map && data["Status"].containsKey("text")) {
          if (data["Status"] is Map && data["Status"]["text"] == "RELOGIN" ||
              data["Status"] is Map && data["Status"]["text"] == "LOGIN") {
            return true;
          }
        }
      }
    }
    return false;
  }
}
