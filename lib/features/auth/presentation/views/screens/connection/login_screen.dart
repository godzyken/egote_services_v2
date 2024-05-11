import 'dart:developer' as developer;

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/features/auth/application/providers/auth_providers.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/auth_controller_state.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../domain/providers/auth_repository_provider.dart';
import '../../widgets/widgets_extensions.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'login');
  final _emailCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  AutovalidateMode? _autovalidateMode;

  bool _isSubmitting = false;

  _LoginScreenState() {
    _emailCtrl.addListener(
        () => ref.watch(loginControllerNotifierProvider).emailFormz);
    _passwordCtrl.addListener(
        () => ref.watch(loginControllerNotifierProvider).passwordFormz);
    _nameCtrl.addListener(() =>
        ref
            .watch(autoAuthControllerProvider)
            ?.userEntityModel
            .name
            .toString() ==
        _nameCtrl.text.toString());
  }

  Future<void> _login() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref
          .read(authStateProvider.notifier)
          .onSignInWithPassword(_emailCtrl.text, _passwordCtrl.text);
    } on AuthException catch (e) {
      developer.log(e.statusCode.toString());
      catchAuthException(e);
    } catch (e) {
      developer.log(e.toString());
      catchException(e);
    }

    setState(() {
      _isSubmitting = false;
    });
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> catchException(
          Object e) =>
      context.showAlert(e.toString());

  void catchAuthException(AuthException e) {
    context.showAlert(e.message);
  }

  @override
  void initState() {
    _isSubmitting = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginController = ref.watch(loginControllerNotifierProvider.notifier);

    final email = ref.watch(loginControllerNotifierProvider).emailFormz;
    final password = ref.watch(loginControllerNotifierProvider).passwordFormz;

    final res = ref.watch(authProvider);

    final isLoading = res.maybeWhen(
      data: (_) => res.isRefreshing,
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.signInWithEmailPassword),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                EmailField(
                  controller: _emailCtrl,
                  label: context.tr!.email,
                  hintText: context.tr!.enterUserEmail,
                  onChanged: (email) => loginController.onEmailChange(email),
                  inputType: TextInputType.emailAddress,
                  validator: (value) => email?.error?.getMessage(),
                  errorText: email?.displayError?.getMessage(),
                ),
                PasswordField(
                  controller: _passwordCtrl,
                  label: context.tr!.password,
                  hintText: context.tr!.enterUserPassword,
                  onChanged: (password) {
                    setState(() {
                      _isSubmitting = true;
                    });
                    loginController.onPasswordChange(password);
                  },
                  inputType: TextInputType.visiblePassword,
                  validator: (value) => password?.error?.getMessage(),
                  errorText: password?.displayError?.getMessage(),
                ),
                const SizedBox(
                  height: 24,
                ),
                SubmitButton(
                  context.tr!.submit,
                  enabled: _isSubmitting,
                  onPressed: onPressedSubmitButton(isLoading, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> Function()? onPressedSubmitButton(
      bool isLoading, BuildContext _) {
    DatadogSdk.instance.rum?.addAction(RumActionType.tap, 'Submit to login');
    return isLoading
        ? null
        : () async {
            if (_formKey.currentState!.validate()) {
              await _login();
              if (mounted) {
                context.showAlert(context.tr!.checkInbox);
                context.goNamed('verify',
                    extra: VerificationScreenParams(
                        email: _emailCtrl.text,
                        password: _passwordCtrl.text,
                        name: _nameCtrl.text));
              }
            } else {
              setState(() {
                _autovalidateMode = AutovalidateMode.always;
              });
            }
          };
  }

  @override
  void dispose() {
    super.dispose();
    _isSubmitting = false;
    _emailCtrl.dispose();
    _nameCtrl.dispose();
    _passwordCtrl.dispose();
  }
}
