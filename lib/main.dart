import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/presentation/dashboard/bloc/home_bloc.dart';
import 'package:flutter_boilerplate/presentation/login/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_boilerplate/utils/constants/app_constants.dart';

import 'config/dependency_injection/locator.dart';
import 'config/router/go_router_helper.dart';
import 'config/themes/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(repository: locator.get()),
      ),
      BlocProvider(
        create: (context) => HomeBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: Constants.appName,
      theme: theme
    );
  }
}
