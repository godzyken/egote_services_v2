import 'package:egote_services_v2/features/auth/application/providers/auth_providers.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../widgets/widgets_extensions.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInController = ref.watch(loginControllerNotifierProvider.notifier);
    final email = ref.watch(loginControllerNotifierProvider).emailFormz;
    final password = ref.watch(loginControllerNotifierProvider).passwordFormz;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.signInWithEmailPassword),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              EmailField(
                label: context.tr!.userEmail,
                hintText: context.tr!.enterUserEmail,
                onChanged: (email) => ref
                    .read(loginControllerNotifierProvider.notifier)
                    .onEmailChange(email),
                inputType: TextInputType.emailAddress,
                validator: (value) => email?.error?.getMessage(),
              ),
              PasswordField(
                label: context.tr!.userPassword,
                hintText: context.tr!.enterUserPassword,
                onChanged: (email) => ref
                    .read(loginControllerNotifierProvider.notifier)
                    .onPasswordChange(email),
                inputType: TextInputType.visiblePassword,
                validator: (value) => password?.error?.getMessage(),
              ),
              SubmitButton(
                onPressed: () => signInController.signInWithPassword(),
                enabled: ref.read(loginControllerNotifierProvider).status ==
                    FormzSubmissionStatus.success,
                context.tr!.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
