import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
      await ref.read(authRepositoryProvider).signUp(
          widget.params.email, widget.params.name, widget.params.password);
      if (mounted) {
        context.showAlert(context.tr!.codeResent);
      }
    } catch (e) {
      if (mounted) {
        context.showAlert(e.toString());
      }
    }
  }

  Future<void> _verify(String code) async {
    if (code.length < 6) return; // Wait for full code if it's 6 digits

    try {
      setState(() {
        _isSubmitting = true;
      });

      final result = await ref
          .read(authRepositoryProvider)
          .verifyCode(widget.params.email, code);

      result.fold(
        (failure) {
          if (mounted) {
            context.showAlert(failure.message);
          }
        },
        (authResponse) {
          if (mounted) {
            context.showAlert(context.tr!.successSignedUp);
            // Navigate to home
            context.go('/user_home/${authResponse.user!.id}');
          }
        },
      );
    } catch (e) {
      if (mounted) {
        context.showAlert(e.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _codeCtrl.dispose();
    super.dispose();
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
          TextFormField(
            controller: _codeCtrl,
            enabled: !_isSubmitting,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: context.tr!.verificationCode,
              border: const OutlineInputBorder(),
              hintText: context.tr!.initCode,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.tr!.missVerification;
              }
              return null;
            },
            onChanged: (value) {
              if (value.length == 6) {
                _verify(value);
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _isSubmitting ? null : () => _verify(_codeCtrl.text),
            child: _isSubmitting 
              ? const CircularProgressIndicator() 
              : Text(context.tr!.verify),
          ),
          TextButton(
            onPressed: _isSubmitting ? null : _resendCode,
            child: Text(context.tr!.codeResent),
          ),
        ],
      ),
    );
  }
}
