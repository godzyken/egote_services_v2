import 'dart:developer';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';

import '../../../../../config/cube_config/cube_config.dart';
import '../../../../common/application/navigation/navigation.dart';
import '../../../data/data_sources/local/pref_util.dart';

const String PHONE_INPUT_ROUTE_NAME = 'PhoneInputScreen';
const String SMS_CODE_INPUT_ROUTE_NAME = 'SMSCodeInputScreen';

class VerifyPhoneNumber extends ConsumerWidget {
  const VerifyPhoneNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      observers: [PhoneAuthRouteObserver(context)],
      key: Navigation.verifyPhoneNavigation,
      onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(
          reverseTransitionDuration:
              Duration(milliseconds: Platform.isIOS ? 1000 : 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          settings: const RouteSettings(name: PHONE_INPUT_ROUTE_NAME),
          pageBuilder: (context, animation, secondaryAnimation) =>
              PhoneInputScreen(
            actions: [
              SMSCodeRequestedAction((ctx1, action, flowKey, phoneNumber) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings:
                        const RouteSettings(name: SMS_CODE_INPUT_ROUTE_NAME),
                    builder: (ctx2) => SMSCodeInputScreen(
                      flowKey: flowKey,
                      actions: [
                        AuthStateChangeAction<SignedIn>((ctx3, state) {
                          log('[AuthStateChangeAction] SignedIn');
                          state.user?.getIdToken().then((idToken) {
                            SharedPrefs.instance.saveLoginType(LoginType.phone);
                            /*signInUsingFirebasePhone( DefaultFirebaseOptions.currentPlatform.projectId, idToken! ).then( (value) =>  Navigator.of(ctx3, rootNavigator: true) .pushNamedAndRemoveUntil('loginToChat', (route) => route.isFirst) ).catchError((onError) => context.showAlert(onError.toString()));*/
                          });
                        }),
                        AuthStateChangeAction<CredentialLinked>((ctx3, state) {
                          log('[AuthStateChangeAction] CredentialLinked');
                          state.user.getIdToken().then((idToken) {
                            SharedPrefs.instance.saveLoginType(LoginType.phone);
                            Navigator.of(ctx3, rootNavigator: true)
                                .pushNamedAndRemoveUntil(
                                    'loginToChat', (route) => false);
                          });
                        }),
                        AuthStateChangeAction<Uninitialized>((ctx3, state) {
                          log('[AuthStateChangeAction] Uninitialized');
                        }),
                        AuthStateChangeAction<CredentialReceived>(
                            (ctx3, state) {
                          log('[AuthStateChangeAction] CredentialReceived');
                        }),
                        AuthStateChangeAction<AuthFailed>((ctx3, state) {
                          log('[AuthStateChangeAction] AuthFailed');
                        }),
                        AuthStateChangeAction<UserCreated>((ctx3, state) {
                          log('[AuthStateChangeAction] UserCreated');
                          state.credential.user?.getIdToken().then((idToken) {
                            SharedPrefs.instance.saveLoginType(LoginType.phone);
                            Navigator.of(ctx3, rootNavigator: true)
                                .pushNamedAndRemoveUntil(
                                    'loginToChat', (route) => false);
                          });
                        }),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class PhoneAuthRouteObserver extends RouteObserver {
  final BuildContext context;

  PhoneAuthRouteObserver(this.context);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    if (route.settings.name == PHONE_INPUT_ROUTE_NAME) {
      context.pop();
    }
  }
}
