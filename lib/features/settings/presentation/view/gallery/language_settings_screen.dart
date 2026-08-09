import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSettingsScreen extends ConsumerWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(localizationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('${context.tr?.languageSettingsScreen}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lang.languageCode == 'en' 
                          ? Theme.of(context).colorScheme.primaryContainer 
                          : null,
                    ),
                    child: Text(
                      context.tr?.english ?? 'English',
                    ),
                    onPressed: () {
                      ref.read(localizationProvider.notifier).en();
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lang.languageCode == 'es' 
                          ? Theme.of(context).colorScheme.primaryContainer 
                          : null,
                    ),
                    child: const Text('Español'),
                    onPressed: () {
                      ref.read(localizationProvider.notifier).es();
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lang.languageCode == 'fr' 
                          ? Theme.of(context).colorScheme.primaryContainer 
                          : null,
                    ),
                    child: const Text('Français'),
                    onPressed: () {
                      ref.read(localizationProvider.notifier).fr();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            ItemWidget(
              title: context.tr?.labelBackground ?? 'Current Language',
              content: lang.languageCode.toUpperCase(),
            ),
            ItemWidget(
              title: 'Locale Identifier',
              content: lang.toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(title ?? '')),
          const Text(' : '),
          Expanded(child: Text(content ?? '')),
        ],
      ),
    );
  }
}
