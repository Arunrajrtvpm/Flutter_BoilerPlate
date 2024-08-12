import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasource/remote/dio_manager.dart';
import '../../data/datasource/remote/remote_datasource.dart';
import '../../presentation/login/repository/login_repository.dart';
import '../../presentation/login/repository/user_repository.dart';
import '../../utils/helper_class/connectivity_helper.dart';


var locator = GetIt.instance;
initializeDependencies() async {
  var dioManager = DioManager();
  locator.registerSingleton<Dio>(dioManager.getDioInstance());
  locator.registerSingleton<RemoteDataSource>(RemoteDataSource(
      dio: locator<Dio>(), connectivityHelper: ConnectivityCheckerHelper()));

  initializeBlocDependencies();
}

void initializeBlocDependencies() {
  locator.registerSingleton(UserRepository());
   locator.registerSingleton(LoginRepository(datasource: locator.get()));
}
