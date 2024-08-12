import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constants/asset_constants.dart';
import '../../utils/constants/router_constants.dart';
import '../login/bloc/authentication/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDelay = 1000;

  @override
  void initState() {
    context.read<AuthenticationBloc>().add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          startTimer(RouterPath.home);
        } else if (state is AuthenticationFailure) {
          startTimer(RouterPath.login);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(child: Image.asset(ImageAssetPath.logoInAppLogo)),
        ),
      ),
    );
  }

  void startTimer(path) {
    Future.delayed(Duration(milliseconds: splashDelay), () {
      context.go(path);
    });
  }
}
