import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/data/datasource/remote/network_config.dart';
import 'package:flutter_boilerplate/presentation/login/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_boilerplate/utils/constants/string_constants.dart';

import 'config/dependency_injection/locator.dart';
import 'config/router/go_router_helper.dart';
import 'config/themes/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  NetworkConfig.baseURL = NetworkConfig.devUrl;
  
  runApp(
    BlocProvider(
      // Create global AuthenticationBloc
      create: (context) => AuthenticationBloc(repository: locator.get()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: Strings.appName,
      theme: theme
    );
  }
}
