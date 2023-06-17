import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/verification_screen.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../application/providers/auth_providers.dart';
import '../../../domain/providers/auth_repository_provider.dart';
import '../models/userlist/user_list_view_model.dart';
import '../widgets/widgets_extensions.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  UserName? _name;
  AutovalidateMode? _autovalidateMode;

  bool _isSubmitting = false;

  Future<void> _createAccount() async {
    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(authRepositoryProvider)
          .signUp(_emailCtrl.text, _usernameCtrl.text, _passwordCtrl.text);

      if(mounted) {
        context.push(
            '/verification',
            extra: VerificationScreenParams(
                email: _emailCtrl.text,
                password: _passwordCtrl.text,
                username: _usernameCtrl.text
            )
        );
      }

    } catch (e) {
      developer.log(e.toString());
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
  }

  @override
  Widget build(BuildContext context) {
    final signUpController = ref.watch(signUpProvider.notifier);

    final name = ref.watch(signUpProvider).nameFormz;
    final email = ref.watch(signUpProvider).emailFormz;
    final password = ref.watch(signUpProvider).passwordFormz;

    ref.listen<AsyncValue<UserModel?>>(authProvider, (previous, next) {
      next.maybeWhen(
        data: (data) {
          if (data == null) return null;
          ref.read(userListViewModelStateNotifierProvider.notifier)
          .createUser(
              data.userEntityModel.name,
              data.userEntityModel.role,
              data.userEntityModel.isComplete,
              data.userEntityModel.createdAt,
              data.userEntityModel.updatedAt,
              data.userEntityModel.emailConfirmedAt,
              data.userEntityModel.phoneConfirmedAt,
              data.userEntityModel.lastSignInAt
          );
          context.pop();
        },
        orElse: () {

      },);
    });
    final res = ref.watch(authProvider);

    final errorText = res.maybeWhen(
      error: (error, stackTrace) => error.toString(),
      orElse: () => null,);

    final isLoading = res.maybeWhen(
      data: (_) => res.isRefreshing,
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.create),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                NameField(
                  label: context.tr!.userName,
                  hintText: context.tr!.enterUsername,
                  controller: _usernameCtrl,
                  onChanged: (name) {
                    if (name.isNotEmpty) {
                      _name = UserName(name);
                      signUpController.onNameChange(name);
                    }
                  },
                  inputType: TextInputType.name,
                  validator: (value) => name?.error?.getMessage(),
                  onEditingComplete: isLoading ? null : () => ref.read(authProvider.notifier).handle(_name!),
                  errorText: errorText,
                ),
                const SizedBox(
                  height: 16,
                ),
                EmailField(
                  label: context.tr!.userEmail,
                  controller: _emailCtrl,
                  hintText: context.tr!.enterUserEmail,
                  onChanged: (email) =>
                      signUpController.onEmailChange(email),
                  inputType: TextInputType.emailAddress,
                  validator: (value) => email?.error?.getMessage(),
                  errorText: errorText,
                ),
                const SizedBox(
                  height: 16,
                ),
                PasswordField(
                  label: context.tr!.userPassword,
                  controller: _passwordCtrl,
                  hintText: context.tr!.enterUserPassword,
                  onChanged: (password) {
                    setState(() {
                      _isSubmitting = true;
                    });
                    signUpController.onPasswordChange(password);
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
                  onPressed: isLoading ? null :  () {
                    if (_formKey.currentState!.validate()) {
                      _createAccount();
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                )
              ],
            ),
          ),
        )
      ),
    );
  }

}
