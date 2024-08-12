import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/themes/text_styles.dart';
import '../../utils/constants/color_constants.dart';
import '../../utils/constants/router_constants.dart';
import '../../utils/constants/string_constants.dart';
import '../../widgets/logout_dialog.dart';
import '../login/bloc/authentication/authentication_bloc.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: getColor(),
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyles.textStyle20BlackW500,
          title: getHeaderView(),
          backgroundColor: getColor(),
          actions: getActionView(),
          iconTheme: IconThemeData(
              color: getColor() == LightCodeColors.black2
                  ? LightCodeColors.white1
                  : LightCodeColors.darkBlue),
        ),
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is UserLogoutFromAppState) {
              context.go(RouterPath.login);
            }
          },
          child: widget.child,
        ));
  }

  getHeaderView() {
    final String location = GoRouterState.of(context).uri.toString();
    var headerStyle = TextStyles.textStyle22DarkBlue;
    switch (location) {
      case RouterPath.home:
        return Text(
          Strings.dashboard,
          style: headerStyle,
        );
      default:
    }
  }

  getActionView() {
    final String location = GoRouterState.of(context).uri.toString();
    switch (location) {
      case RouterPath.home:
        return [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LogoutConfirmationDialog(
                      onConfirmLogout: () {
                        context.read<AuthenticationBloc>().add(AppLogout());
                      },
                    );
                  },
                );
              },
              icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.black)),
                child: const Icon(
                  Icons.person_outline,
                  size: 21,
                  color: Colors.black,
                ),
              ))
        ];

      default:
        return <Widget>[];
    }
  }

  getColor() {
    final String location = GoRouterState.of(context).uri.toString();
    switch (location) {
      case RouterPath.home:
        return LightCodeColors.white1;
      default:
        return LightCodeColors.lightOrange;
    }
  }
}
