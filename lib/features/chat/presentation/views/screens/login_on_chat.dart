import 'dart:async';
import 'dart:convert';

import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/config/app_shared/extensions/extensions.dart' as platform_utils;
import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/auth/application/providers/auth_providers.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../config/app_shared/extensions/extensions.dart';
import '../../../../../firebase_options.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../auth/presentation/views/widgets/widgets_extensions.dart';
import '../../../application/managers/push_notifications_manager.dart';
import '../../../data/data_sources/local/pref_util.dart';

class LoginOnChat extends ConsumerStatefulWidget {
  const LoginOnChat({super.key});

  @override
  ConsumerState createState() => _LoginOnChatState();
}

enum FormType { login, register }

class _LoginOnChatState extends ConsumerState<LoginOnChat>  {
  final TextEditingController _loginFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _login = "";
  String _password = "";

  FormType _form = FormType.login;

  bool _isLoginContinues = false;

  List<bool> loginEmailSelection = [true, false];
  bool isEmailSelected = false;

  _LoginOnChatState() {
    _loginFilter.addListener(() {
      setState(() {
        if (_loginFilter.text.isEmpty) {
          _login = "";
        } else {
          _login = _loginFilter.text;
        }
      });
    });
    _passwordFilter.addListener(() {
      setState(() {
        if (_passwordFilter.text.isEmpty) {
          _password = "";
        } else {
          _password = _passwordFilter.text;
        }
      });
    });
  }

  // Swap in between our two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loginEmailSelection = [true, false];

    isEmailSelected = loginEmailSelection[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[_buildLogoField(), _initLoginWidgets()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoField() {
    return Container(
      child: Align(
        alignment: FractionalOffset.center,
        child: Column(
          children: [
            ConstrainedBox(constraints: const BoxConstraints(maxWidth: 350),
              child: Assets.lottie.image.logoTchat1022x1024.image(
                height: 200
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              height: 18,
              width: 18,
              child: Visibility(
                visible: _isLoginContinues,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _initLoginWidgets() {
    return FutureBuilder(
        future: getFilterChipsWidgets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          }
          return const SizedBox.shrink();
        },
    );
  }

  Future<Widget> getFilterChipsWidgets() async {
    if (_isLoginContinues) return const SizedBox.shrink();
    SharedPrefs sharedPrefs = await SharedPrefs.instance.init();
    var loginType = sharedPrefs.getLoginType();
    var user = await sharedPrefs.getUser().then((value) => value);
    if ((user != null && loginType == null) || loginType != null) {
      _loginToCCWithSavedUser(loginType ?? LoginType.login);
      return const SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[_buildTextFields(), _buildButtons()],
      );
    }
  }

  Widget _buildTextFields() {
    final loginController = ref.watch(loginControllerNotifierProvider.notifier);
    final nameController = ref.watch(signUpProvider.notifier);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: ToggleButtons(
              constraints: const BoxConstraints(maxHeight: 38),
              borderColor: Colors.green,
              fillColor: Colors.green.shade400,
              borderWidth: 1,
              selectedBorderColor: Colors.green,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(28),
              onPressed: (index) {
                setState(() {
                  for (int i = 0; i < loginEmailSelection.length; i++) {
                   if (i == index) {
                     loginEmailSelection[i] = true;
                   } else {
                     loginEmailSelection[i] = false;
                   }
                  }
                  isEmailSelected = loginEmailSelection[1];
                });
              },
              isSelected: loginEmailSelection,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 6.0),
                  child: Text(
                    'By Login',
                    style: TextStyle(
                        color: isEmailSelected ? Colors.green : Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4, horizontal: 6.0),
                  child: Text(
                    'By E-mail',
                    style: TextStyle(
                        color: isEmailSelected ? Colors.white : Colors.green),
                  ),
                ),
              ],
            ),
          ),
          EmailField(
            inputType: isEmailSelected
                ? TextInputType.emailAddress
                : TextInputType.text,
            controller: _loginFilter,
            hintText: isEmailSelected ? context.tr!.enterUserEmail : 'login',
            onChanged: (value) => isEmailSelected ? loginController.onEmailChange(value) : nameController.onNameChange(value),
            label: isEmailSelected ? 'E-mail' : 'Login',
          ),
          PasswordField(
            inputType: TextInputType.visiblePassword,
            controller: _passwordFilter,
            obscureText: true,
            onChanged: (password) => loginController.onPasswordChange(password),
            hintText: context.tr!.enterUserPassword,
            label: 'Password',
            onEditingComplete: () {
              _form == FormType.login
                  ? _loginPressed()
                  : _createAccountPressed();
            },
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: _form == FormType.login
          ? Container(
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _loginPressed,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: _formChange,
              child: const Text(
                  'Don\'t have an account? Tap here to register.'),
            ),
            ...createCIPButtons(),
          ],
        ),
      )
          : Container(
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _createAccountPressed,
              child: const Text('Create an Account'),
            ),
            TextButton(
              onPressed: _formChange,
              child: const Text('Have an account? Click here to login.'),
            ),
            ...createCIPButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget> createCIPButtons() {
    return [
      Visibility(
        visible: platform_utils.isPhoneAuthSupported,
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(190, 36),
          ),
          icon: const Icon(
            Icons.dialpad,
          ),
          label: const Text('By Phone number'),
          onPressed: () {
            platform_utils.showModal(
                context: context, child: const VerifyPhoneNumber());
          },
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blue,
          minimumSize: const Size(190, 36),
        ),
        icon: Icon(
          Icons.facebook,
          color: Colors.blue.shade700,
        ),
        label: Text(
          'By Facebook',
          style: TextStyle(color: Colors.blue.shade700),
        ),
        onPressed: () {
          context.showAlert('Coming soon');
        },
      ),
    ];
  }

  void _loginPressed() {
    log('login with $_login and $_password');
    var userToLogin = CubeUser();
    if (isEmailSelected) {
      userToLogin.email = _login;
    } else {
      userToLogin.login = _login;
    }

    userToLogin.password = _password;

    _loginToCC(context, userToLogin, saveUser: true);
  }

  void _createAccountPressed() {
    log('create an user with $_login and $_password');
    var userToSignUp = CubeUser();
    if (isEmailSelected) {
      userToSignUp.email = _login;
    } else {
      userToSignUp.login = _login;
    }

    userToSignUp.password = _password;
    userToSignUp.fullName = _login;

    _signInCC(context, userToSignUp);
  }

  _signInCC(BuildContext context, CubeUser user) async {
    if (_isLoginContinues) return;

    setState(() {
      _isLoginContinues = true;
    });
    if (!ref.watch(cubeSessionManagerProvider).isActiveSessionValid()) {
      final state = SharedPrefs.instance;
      try {

        await createSession(user).then((cubeSession) {

          if (cubeSession.timestamp != null) {
            state..startSession(cubeSession, _isLoginContinues)
              ..getLoginType()
              ..getSubscriptionToken()
              ..getSubscriptionId()
              ..getSelectedDialogId()
              ..getUser();

            user = cubeSession.user!;

            PushNotificationsManager.instance.init();

           return user.id == cubeSession.userId ? user : null;
          }

        }
        ).onError((ExceptionCause error, stackTrace) => handleError(error, stackTrace));
      } on Exception catch (error) {
        _processLoginError(context, error);
        rethrow;
      }
    }
    await signUp(user).then((newUser) {
      log("signUp newUser $newUser");
      user.id = newUser.id;
      SharedPrefs.instance.saveNewUser(
          user, isEmailSelected ? LoginType.email : LoginType.login);
      PushNotificationsManager.instance.init();
      signIn(user).then((result) {
        _loginToCubeChat(context, user);
      });
    }).catchError((exception) {
       _processLoginError(context, exception);
    });
  }

  _loginToCC(BuildContext context, CubeUser user, {bool saveUser = false}) async {
    log("_loginToCC user: $user");
    if (_isLoginContinues) return;
    setState(() {
      _isLoginContinues = true;
    });

    await createSession(user).then((cubeSession) {
      log("createSession cubeSession: $cubeSession");
      var tempUser = user;
      user = cubeSession.user!..password = tempUser.password;
      if (saveUser) {
        SharedPrefs.instance.init().then((sharedPrefs) {
          sharedPrefs.saveNewUser(
              user, isEmailSelected ? LoginType.email : LoginType.login);
        });
      }

      PushNotificationsManager.instance.init();

      _loginToCubeChat(context, user);
    }).catchError((error) {
      _processLoginError(context, error);
    });
  }

  _loginToCCWithSavedUser(LoginType loginType) async {
    log("[_loginToCCWithSavedUser] user: $loginType");
    if (_isLoginContinues) return;
    setState(() {
      _isLoginContinues = true;
    });

    Future<CubeUser>? signInFuture;
    if (loginType == LoginType.phone) {
      var phoneAuthToken = await ref.watch(firebaseAuthProvider).currentUser?.getIdToken();
      if (phoneAuthToken == null) {
        setState(() {
          _isLoginContinues = false;
        });

        ErrorWidget('Your Phone authentication session was expired, please refresh it by second login using your phone number');
        return;
      }

      signInFuture = createSession().then((cubeSession) {
        return signInUsingFirebase(
            DefaultFirebaseOptions.currentPlatform.projectId,
            phoneAuthToken)
            .then((cubeUser) {
          return SharedPrefs.instance.init().then((sharedPrefs) {
            sharedPrefs.saveNewUser(cubeUser, LoginType.phone);
            return cubeUser
              ..password = ref.read(cubeSessionManagerProvider).activeSession?.token;
          });
        });
      });
    } else if (loginType == LoginType.login || loginType == LoginType.email) {
      signInFuture = SharedPrefs.instance.init().then((sharedPrefs) {
        return sharedPrefs.getUser().then((savedUser) =>  savedUser!);
      });
    }

    signInFuture?.then((cubeUser) {
      PushNotificationsManager.instance.init();

      _loginToCubeChat(context, cubeUser);
    }).catchError((error) {
      _processLoginError(context, error);
    });
  }

  _loginToCubeChat(BuildContext context, CubeUser user) {
    log("_loginToCubeChat user $user");
    ref.watch(cubeChatConnectionSettingsProvider).totalReconnections = 0;
    ref.watch(cubeChatConnectionProvider).login(user).then((cubeUser) {
      _isLoginContinues = false;
      _goDialogScreen(context, cubeUser);
    }).catchError((error) {
      _processLoginError(context, error);
    });
  }

  void _processLoginError(BuildContext context, Exception? exception) {
    log("Login error $exception");
    setState(() {
      _isLoginContinues = false;
    });
    context.showAlert(exception!.toString());
  }

  void _goDialogScreen(BuildContext context, CubeUser cubeUser) async {
    log("_goDialogScreen");
    FlutterLocalNotificationsPlugin()
        .getNotificationAppLaunchDetails()
        .then((details) {
      log("getNotificationAppLaunchDetails");
      String? payload = details!.notificationResponse?.payload;

      log("getNotificationAppLaunchDetails, payload: $payload");

      var dialogId;
      if (payload == null) {
        dialogId = SharedPrefs.instance.getSelectedDialogId();
        log("getNotificationAppLaunchDetails, selectedDialogId: $dialogId");
      } else {
        Map<String, dynamic> payloadObject = jsonDecode(payload);
        dialogId = payloadObject['dialog_id'];
      }

      if (dialogId != null && dialogId.isNotEmpty) {
        getDialogs({'id': dialogId}).then((dialogs) {
          if (dialogs?.items != null && dialogs!.items.isNotEmpty) {
            CubeDialog dialog = dialogs.items.first;
            navigateToNextScreen(cubeUser, dialog);
          } else {
            navigateToNextScreen(cubeUser, null);
          }
        }).catchError((onError) {
          navigateToNextScreen(cubeUser, null);
        });
      } else {
        navigateToNextScreen(cubeUser, null);
      }
    }).catchError((onError) {
      log("getNotificationAppLaunchDetails ERROR: $onError");
      navigateToNextScreen(cubeUser, null);
    });
  }

  void navigateToNextScreen(CubeUser cubeUser, CubeDialog? dialog) {
    SharedPrefs.instance.saveSelectedDialogId('');
    context.pushReplacementNamed(
      'select_dialog',
      extra: {USER_ARG_NAME: cubeUser, DIALOG_ARG_NAME: dialog},
    );

    if (dialog != null && !platform_utils.isDesktop()) {
      context.pushNamed('chat_dialog',
          extra: {USER_ARG_NAME: cubeUser, DIALOG_ARG_NAME: dialog});
    }
  }

  handleError(ExceptionCause? object, StackTrace stackTrace) {
    if(object!.exception && object.stackTrace) {
      stackTrace = object.stackTrace;

      log('HandleError: ${object.exception}  with stackTrace : $stackTrace');
      return _processLoginError(context, object.exception);
    }

    return;
  }


}
