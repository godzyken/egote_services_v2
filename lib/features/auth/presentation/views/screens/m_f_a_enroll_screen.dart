import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';


class MFAEnrollScreen extends ConsumerStatefulWidget {
  const MFAEnrollScreen({
    Key? key, required this.params,
  }) : super(key: key);

  final VerificationScreenParams params;

  @override
  ConsumerState createState() => _MFAEnrollScreenState();
}

class _MFAEnrollScreenState extends ConsumerState<MFAEnrollScreen> {

  @override
  Widget build(BuildContext context) {
    final _enrollFuture = ref.read(authRepositoryProvider).enRoll();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _enrollFuture,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()),);
          } else if(!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(),);
          }
          final response = snapshot.data!.getOrElse(
                  (l) => AuthMFAEnrollResponse(
                      id: l.error,
                      type: FactorType.totp,
                      totp: TOTPEnrollment(
                          qrCode: l.error,
                          secret: l.error,
                          uri: l.error),
                  ),
          );

          final qrCodeUrl = response.totp.qrCode;
          final secret = response.totp.secret;

          return ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20
            ),
            children: [
              const Text('Open your authentication app and add this app via QR code or by pasting the code below.'),
              const SizedBox(height: 16),
              Assets.lottie.models.andySvg.svg(
                  package: qrCodeUrl,
                  height: 150,
                  width: 150
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(child: Text('Secret', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),)),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: secret));
                        context.showAlert('Copied your clip board');
                      },
                      icon: const Icon(Icons.copy)
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Enter the code shown in your authentication app.'),
              const SizedBox(height: 16),
              TextInputField(
                  hintText: '000000',
                  onChanged: (code) async {
                    if (code.length != 6) return;

                    try {
                      await ref.read(authRepositoryProvider).getCode(code);

                      final client = await ref
                          .read(authRepositoryProvider)
                          .client
                          .refreshSession();

                      if (mounted) {
                        final String location = context.namedLocation(
                            'user_home',
                            pathParameters: {'pid': client.user!.id}
                        );
                        context.go(location);
                      }
                    } on AuthException catch (error) {
                      context.showAlert(error.message);
                    } catch (error) {
                      context.showAlert(error.toString());
                    }
                  },
                  inputType: TextInputType.number,
                  label: 'Enter Code'
              ),
            ],
          );
        },
      ),
    );
  }
}
