// import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../../../chat/domain/models/entities/cube_user/cube_user_mig.dart';
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
  const VerificationScreen({super.key, required this.params});

  final VerificationScreenParams params;

  @override
  ConsumerState<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'verify');
  bool _isSubmitting = false;

  final _codeCtrl = TextEditingController();

  Future<void> _resendCode() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(authRepositoryProvider).signUp(
          widget.params.email, widget.params.name, widget.params.password);
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
        title: Text(context.tr!.verification),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        children: [
          Text(
              '${context.tr!.verificationCodeSent} ${context.tr!.toYourEmailAddress} ${widget.params.email}'),
          const SizedBox(
            height: 30,
          ),
          TextInputField(
            controller: _codeCtrl,
            obscureText: _isSubmitting,
            hintText: context.tr!.initCode,
            decoration: InputDecoration(
              labelText: context.tr!.verificationCode,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr!.missVerification;
              }
              return null;
            },
            onChanged: (p0) async {
              try {
                setState(() {
                  _isSubmitting = true;
                });

                final code = await ref
                    .read(authRepositoryProvider)
                    .verifyCode(widget.params.email, p0);

                final auth = await ref.read(authRepositoryProvider).signUp(
                    widget.params.email,
                    widget.params.name,
                    widget.params.password);

                final user = auth.getOrElse((l) => UserModel.complete(
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
                    cubeUser: const CubeUserMig()));

                final client = code.getOrElse((l) => AuthResponse(
                    user: user.authUser,
                    session: Session.fromJson(user.authUser.toJson())));

                if (mounted) {
                  //TODO: Go User_home on Validate don't work
                  context.showAlert(context.tr!.successSignedUp);

                  final String location = context.namedLocation('user_home',
                      pathParameters: {'pid': client.user!.id});
                  context.go(location);
                }
              } catch (e) {
                context.showAlert(e.toString());
              }
              setState(() {
                _isSubmitting = false;
              });
            },
            label: context.tr!.verificationCode,
          ),
          const SizedBox(
            height: 20,
          ),
          SubmitButton(
            context.tr!.codeResent,
            fontSize: 16,
            height: 42,
            key: _formKey,
            onPressed: () async {
              await _resendCode();
              if (mounted) {
                context.showAlert(context.tr!.codeResent);
              }
            },
          ),
        ],
      ),
    );
  }
}
