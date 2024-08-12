import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/asset_constants.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/helper_class/connectivity_helper.dart';
import '../../home_viewer/widgets/close_app_dialog.dart';
import '../bloc/home_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    subscription = ConnectivityCheckerHelper.listenToConnectivityChanged()
        .listen((ConnectivityResult event) {
      context.read<HomeBloc>().add(NetworkConnectionStateChangeEvent(
          isNetworkConnected: ConnectivityCheckerHelper.handleResult(event)));
    });

    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CloseAppConfirmationDialog(
              onConfirmLogout: () {
                SystemNavigator.pop();
              },
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: white1,
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Column(children: [header(), Expanded(child: homeBody())]),
          ),
        ),
      ),
    );
  }

  header() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Image.asset(
        ImageAssetPath.logoInAppLogo,
      ),
    );
  }

  homeBody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return const Center(
          child: Text("Welcome to the Sample Flutter App"),
        );
      },
    );
  }
}
