import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/providers/auth_repository_provider.dart';

class VerificationScreenParams {
  const VerificationScreenParams({
    required this.email,
    required this.password,
    required this.username,
  });
  final String email;
  final String password;
  final String username;
}

class VerificationScreen extends ConsumerStatefulWidget {
  const VerificationScreen({
    Key? key, required this.params
  }) : super(key: key);

  final VerificationScreenParams params;

  @override
  ConsumerState<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? _autovalidateMode;
  bool _isSubmitting = false;

  final _codeCtrl = TextEditingController();

  Future<void> _resendCode() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(authRepositoryProvider).signUp(
          widget.params.email,
          widget.params.username,
          _codeCtrl.text
      );

      if (mounted) {
        context.showAlert('Code resent');
      }
    } catch (e) {
      context.showAlert(e.toString());
    }
    setState(() {
      _isSubmitting = false;
    });
  }

  Future<void> _verify() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(authRepositoryProvider).verifyCode(
          widget.params.email,
          _codeCtrl.text
      );

      if (mounted) {
        context.showAlert('Successfully signed up');
        context.go('/user_home');
      }
    } catch (e) {
      context.showAlert(e.toString());
    }
    setState(() {
      _isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Verification'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                children: [
                  Text('Enter the verification code sent'
                  'to your email address ${widget.params.email}'),
                  const SizedBox(height: 30,),
                  TextInputField(
                    controller: _codeCtrl,
                    obscureText: _isSubmitting,
                    hintText: 'Verification code',
                    decoration: const InputDecoration(
                      labelText: 'Verification code',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Missing the verification code';
                      }
                      return null;
                    },
                    onChanged:(p0) => _verify(),
                    label: 'Verification code',
                  ),
                  const SizedBox(height: 20,),
                  SubmitButton(
                    'Resend Code',
                    fontSize: 12,
                    height: 20,
                    key: _formKey,
                    enabled: _isSubmitting,
                    onPressed: _isSubmitting ? null : () => _resendCode(),
                  ),
                  const SizedBox(height: 10,),
                  SubmitButton(
                    context.tr!.submit,
                    fontSize: 12,
                    height: 20,
                    key: _formKey,
                    enabled: _isSubmitting,
                    //onPressed:  _isSubmitting ? null : () => context.go('/user_home'),
                    onPressed:  _isSubmitting ? null : () {
                      if (_formKey.currentState!.validate()) {
                        _verify();
                      } else {
                        setState(() {
                          _autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                ],
              )
          ),
        ),
    );
  }
}
