import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers/auth_providers.dart';
import '../widgets/widgets_extensions.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpController = ref.watch(signUpProvider.notifier);

    final name = ref.watch(signUpProvider).nameFormz;
    final email = ref.watch(signUpProvider).emailFormz;
    final password = ref.watch(signUpProvider).passwordFormz;

    /*   ref.listen<SignUpState>(signUpProvider, (previous, next) {
      if (next.status!.isInProgress) {
        showDialog(
            context: context,
            builder: (_) => SimpleDialog(
                  title: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(context.tr.loading),
                  ),
                ));
      } else if (next.status!.isFailure) {
        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${next.errorMessage}"),
          ),
        );
      } else if (next.status!.isSuccess) {
        Navigator.of(context).pop();
      }
    });*/
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.create),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              NameField(
                label: context.tr!.userName,
                hintText: context.tr!.enterUsername,
                onChanged: (name) =>
                    ref.read(signUpProvider.notifier).onNameChange(name),
                inputType: TextInputType.emailAddress,
                validator: (value) => name?.error?.getMessage(),
              ),
              const SizedBox(
                height: 16,
              ),
              EmailField(
                label: context.tr!.userEmail,
                hintText: context.tr!.enterUserEmail,
                onChanged: (email) =>
                    ref.read(signUpProvider.notifier).onEmailChange(email),
                inputType: TextInputType.emailAddress,
                validator: (value) => email?.error?.getMessage(),
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                label: context.tr!.userPassword,
                hintText: context.tr!.enterUserPassword,
                onChanged: (password) =>
                    ref.read(signUpProvider.notifier).onPasswordChange(password),
                inputType: TextInputType.visiblePassword,
                validator: (value) => password?.error?.getMessage(),
                errorText: password?.displayError?.getMessage(),
              ),
              const SizedBox(
                height: 24,
              ),
              SubmitButton(
                context.tr!.submit,
               // enabled: ref.watch(signUpProvider).status == FormzSubmissionStatus.success,
                onPressed: () => ref.read(signUpProvider.notifier).signUpWithEmailAndPassword(),
              )
            ],
          ),
        ),
      ),
    );
  }

}
