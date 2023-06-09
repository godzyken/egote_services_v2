import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../../domain/providers/auth_repository_provider.dart';


class VerificationScreenParams {
  const VerificationScreenParams({
    required this.email,
    required this.password,
    required this.name,
  });
  final String email;
  final String password;
  final String name;
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(debugLabel: 'verify');
  bool _isSubmitting = false;

  final _codeCtrl = TextEditingController();

  Future<void> _resendCode() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(authRepositoryProvider).signUp(
          widget.params.email,
          widget.params.name,
          widget.params.password
      );

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
  void dispose() {
    super.dispose();
    _isSubmitting = false;
    _codeCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        children: [
          Text('Enter the verification code sent'
              'to your email address ${widget.params.email}'),
          const SizedBox(height: 30,),
          TextInputField(
            controller: _codeCtrl,
            obscureText: _isSubmitting,
            hintText: '000000',
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
            onChanged:(p0) async {
              try {
                setState(() {
                  _isSubmitting = true;
                });

                final code = await ref.read(authRepositoryProvider).verifyCode(
                    widget.params.email,
                    p0
                );

                final auth = await ref.read(authRepositoryProvider).signUp(
                    widget.params.email,
                    widget.params.name,
                    widget.params.password
                );

                final user = auth.getOrElse((l) =>
                    UserModel.complete(
                        id: UserId(value: l.error.length),
                        userEntityModel: UserEntityModel.empty(),
                        authUser: AuthUser(
                          id: l.error,
                          appMetadata: {},
                          userMetadata: {},
                          aud: l.error,
                          email: l.error,
                          phone: l.error,
                          createdAt: l.error,
                          role: l.error,
                          updatedAt: l.error,
                        ),
                        cubeUser: CubeUser()
                    ));

                final client = code.getOrElse((l) => AuthResponse(
                    user: user.authUser,
                    session: Session.fromJson(user.authUser.toJson())
                ));

                if (mounted) {
                  context.showAlert('Successfully signed up');

                  final String location = context.namedLocation(
                      'user_home',
                      pathParameters: {'pid': client.user!.id}
                  );
                  context.go(location);
                }
              } catch (e) {
                context.showAlert(e.toString());
              }
              setState(() {
                _isSubmitting = false;
              });
            },
            label: 'Verification code',
          ),
          const SizedBox(height: 20,),
          SubmitButton(
            'Resend Code',
            fontSize: 16,
            height: 20,
            key: _formKey,
            enabled: _isSubmitting,
            onPressed: _isSubmitting ? null : () async {
              await _resendCode();
              if (mounted) {
                context.showAlert('Code resent');
              }
            },
          ),
        ],
      ),
    );
  }
}
