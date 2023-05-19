import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DevisEditScreen extends ConsumerWidget {
  final int did;

  const DevisEditScreen({Key? key, required this.did}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Devis'),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: MaterialButton(
            padding: const EdgeInsets.all(16),
            color: scheme.primary,
            onPressed: () {},
            child: Text("Done".toUpperCase()),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Center(
                        child: Icon(
                          Icons.photo,
                          color: scheme.primaryContainer,
                        ),
                      ),
                    ),
                    Material(
                      color: theme.cardColor.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pick Image".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: style.bodySmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                minLines: 5,
                maxLines: 20,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),
            ],
          ),
        ));
  }
}
