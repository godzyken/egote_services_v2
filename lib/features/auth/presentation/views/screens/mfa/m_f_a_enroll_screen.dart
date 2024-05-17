import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/mfa/verification_screen.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MFAEnrollScreen extends ConsumerStatefulWidget {
  const MFAEnrollScreen({
    super.key,
    required this.params,
  });

  final VerificationScreenParams params;

  @override
  ConsumerState createState() => _MFAEnrollScreenState();
}

class _MFAEnrollScreenState extends ConsumerState<MFAEnrollScreen> {
  @override
  Widget build(BuildContext _) {
    final enrollFuture = ref.read(supabaseClientProvider).auth.mfa.enroll();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: enrollFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final response = snapshot.data!;

          final qrCodeUrl = response.totp.qrCode;
          final secret = response.totp.secret;
          final factorId = response.id;

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Text(context.tr!.openViaQr),
              const SizedBox(height: 16),
              Assets.lottie.models.frame
                  .svg(package: qrCodeUrl, height: 150, width: 150),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    context.tr!.secret,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: secret));
                        context.showAlert(context.tr!.copiedClipBoard);
                      },
                      icon: const Icon(Icons.copy)),
                ],
              ),
              const SizedBox(height: 16),
              Text(context.tr!.enterCodeSent),
              const SizedBox(height: 16),
              TextInputField(
                  hintText: context.tr!.initCode,
                  onChanged: (code) async {
                    if (code.length != 6) return;

                    try {
                      final challenge = await ref
                          .read(supabaseClientProvider)
                          .auth
                          .mfa
                          .challenge(factorId: factorId);

                      final client = await ref
                          .read(supabaseClientProvider)
                          .auth
                          .mfa
                          .verify(
                              factorId: factorId,
                              challengeId: challenge.id,
                              code: code);

                      await ref
                          .read(supabaseClientProvider)
                          .auth
                          .refreshSession();

                      if (mounted) {
                        final String location = context.namedLocation(
                            'user_home',
                            pathParameters: {'pid': client.user.id});

                        setState(() {
                          context.go(location);
                        });
                      }
                    } on AuthException catch (error) {
                      if (mounted) {
                        setState(() {
                          context.showAlert(error.message);
                        });
                      }
                    } catch (error) {
                      if (mounted) {
                        setState(() {
                          context.showAlert(error.toString());
                        });
                      }
                    }
                  },
                  inputType: TextInputType.number,
                  label: context.tr!.enterCode),
            ],
          );
        },
      ),
    );
  }
}
