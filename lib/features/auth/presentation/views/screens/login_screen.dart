import 'package:egote_services_v2/features/auth/application/providers/auth_providers.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/auth_controller_state.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/verification_screen.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets_extensions.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  AutovalidateMode? _autovalidateMode;

  bool _isSubmitting = false;

  Future<void> _login() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(authStateProvider.notifier)
          .onSignInWithPassword(_emailCtrl.text, _passwordCtrl.text);

      if(mounted) {
        context.showAlert('Check your inbox');

        final String location = context.namedLocation('verification');
        context.push(
            location,
            extra: VerificationScreenParams(
                email: _emailCtrl.text,
                password: _passwordCtrl.text,
                name: _nameCtrl.text
            )
        );
      }

    } catch (e) {
      context.showAlert(e.toString());
    }

    setState(() {
      _isSubmitting = false;
    });
  }

  @override
  void initState() {

    _isSubmitting = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = ref.watch(loginControllerNotifierProvider).emailFormz;
    final password = ref.watch(loginControllerNotifierProvider).passwordFormz;
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
                  label: context.tr!.userEmail,
                  hintText: context.tr!.enterUserEmail,
                  onChanged: (email) => ref
                      .read(loginControllerNotifierProvider.notifier)
                      .onEmailChange(email),
                  inputType: TextInputType.emailAddress,
                  validator: (value) => email?.error?.getMessage(),
                ),
                PasswordField(
                  controller: _passwordCtrl,
                  label: context.tr!.userPassword,
                  hintText: context.tr!.enterUserPassword,
                  onChanged: (password) {
                    setState(() {
                      _isSubmitting = true;
                    });
                    ref
                        .read(loginControllerNotifierProvider.notifier)
                        .onPasswordChange(password);
                  },
                  inputType: TextInputType.visiblePassword,
                  validator: (value) => password?.error?.getMessage(),
                ),
                SubmitButton(
                  enabled: _isSubmitting,
                  onPressed: _isSubmitting ? null : () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  context.tr!.submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();

  }
}
