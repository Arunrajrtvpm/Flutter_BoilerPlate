import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:go_router/go_router.dart';

import '../../../config/themes/text_styles.dart';
import '../../../data/datasource/remote/network_config.dart';
import '../../../data/model/login/request/login_request.dart';
import '../../../utils/app_utils/app_utils.dart';
import '../../../utils/constants/asset_constants.dart';
import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/router_constants.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/app_loader.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_checkbox.dart';
import '../../../widgets/toast.dart';
import '../bloc/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          if (isRememberMeChecked) {
            //MARK: Create a Flutter Secure storage and store the details in it.
          } else {
            //MARK:Clear all the existing data from the Secure storage.
          }
          showSnackBar(ToastStyle.success, context, Strings.loginSuccessful);

          Future.delayed(const Duration(milliseconds: 1000), () {
            context.go(RouterPath.home);
          });
        } else if (state is LoginFailure) {
          showSnackBar(ToastStyle.error, context, state.error);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: GestureDetector(
            onTap: () {
              if (isKeyboardOpen(context)) {
                closeKeyboard(context);
              }
            },
            child: Stack(
              children: [
                loginBody(context),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoader) {
                      return const AppLoader();
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginBody(BuildContext context) {
    return Container(
        color: LightCodeColors.lightOrange,
        child: Column(children: [
          headerSection(),
          middleSection(),
          bottomSection(),
        ]));
  }

  Widget bottomSection() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.bottomCenter,
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: Image.asset(
              ImageAssetPath.logo,
              height: 50,
              width: 150,
            ),
          ),
          const Text(
            Strings.poweredBy,
            style: TextStyles.textStyle12Black,
          ),
        ]),
      ),
    );
  }

  headerSection() {
    return Column(children: [
      Image.asset(
        ImageAssetPath.loginPattern,
        fit: BoxFit.cover,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Image.asset(ImageAssetPath.logoInAppLogo),
      )
    ]);
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  middleSection() {
    return Expanded(
      flex: 2,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLoginLabel(),
                _textFieldView(_usernameController, Strings.userName),
                _textFieldView(_passwordController, Strings.password,
                    showObscureText: true),
                _buildLoginBtn(),
                _forgotPassword(() {
                  launchURL(NetworkConfig.signUpURL);
                }),
                _rememberMeBox(),
                _signUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLabel() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        Strings.login,
        style: TextStyles.textStyle24DarkBlue,
      ),
    );
  }

  Widget _textFieldView(controller, text, {showObscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: TextFormField(
              style: TextStyles.textStyle14Black1,
              obscureText: showObscureText,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                labelText: text,
                labelStyle: TextStyles.textStyle12,
                hintStyle: TextStyles.textStyle12,
                hintText: text,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              validator: MultiValidator([
                RequiredValidator(errorText: Strings.pleaseEnterValidCred),
              ]).call),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return InAppCustomButton(
        text: Strings.login,
        onPressed: () {
          closeKeyboard(context);
          if (formKey.currentState!.validate()) {
            var loginRequest = LoginRequest(
                login: Login(
                    email: _usernameController.text.trim(),
                    password: _passwordController.text.trim(),
                    objectAttributes:
                        LoginAttributes(version: "1.0.0", uptime: "53722524")));
            context
                .read<LoginBloc>()
                .add(InititateLoginEvent(requestBody: loginRequest));
          }
        });
  }

  Widget _signUpButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 50.0, 0.0, 0.0),
      child: Row(
        children: [
          Expanded(
            child: RichText(
                maxLines: 2,
                text: TextSpan(
                  style: TextStyles.textStyle15Black1,
                  children: <TextSpan>[
                    const TextSpan(text: Strings.dontHaveAnAccount),
                    const TextSpan(text: " "),
                    TextSpan(
                        text: Strings.clickHere,
                        style: TextStyles.textStyle15Blue,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchURL(NetworkConfig.signUpURL);
                          }),
                    const TextSpan(text: " "),
                    const TextSpan(text: Strings.toSignUp),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  bool isRememberMeChecked = false;

  _rememberMeBox() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(left: 10),
          child: CustomCheckbox(
            value: isRememberMeChecked,
            label: Strings.rememberMe,
            onChanged: (value) {
              isRememberMeChecked = !isRememberMeChecked;
              context.read<LoginBloc>().add(RememberMeCheckChangedEvent());
            },
          ),
        );
      },
    );
  }

  _forgotPassword(Function()? callback) {
    return TextButton(
        onPressed: callback,
        child: const Text(Strings.forgotPassword,
          style: TextStyles.underlinedTextStyle16,
        ));
  }
}
