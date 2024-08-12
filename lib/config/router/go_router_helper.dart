import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/dashboard/screen/dashboard.dart';
import '../../presentation/home_viewer/home_viewer.dart';
import '../../presentation/login/bloc/login/login_bloc.dart';
import '../../presentation/login/screen/login_screen.dart';
import '../../presentation/splash_screen/splash_screen.dart';
import '../../utils/constants/router_constants.dart';
import '../dependency_injection/locator.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouterPath.initial,
    routes: [
      GoRoute(
        path: RouterPath.initial,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
          path: RouterPath.login,
          builder: (context, state) => BlocProvider(
                create: (context) => LoginBloc(
                    repository: locator.get(), authBloc: context.read()),
                child: const LoginScreen(),
              )),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return HomeScreen(child: child);
          },
          routes: [
            GoRoute(
                path: RouterPath.home,
                builder: (context, state) => const DashboardScreen(),
                routes: const []),
          ])
    ]);
