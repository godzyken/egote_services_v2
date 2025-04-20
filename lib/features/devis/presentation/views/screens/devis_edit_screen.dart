import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/features/devis/domain/providers/edit_devis_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DevisEditScreen extends ConsumerWidget {
  final String devisId;

  const DevisEditScreen({super.key, required this.devisId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;

    final viewModel = ref.watch(editDeviViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.addDevis),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: MaterialButton(
          padding: const EdgeInsets.all(16),
          color: scheme.primary,
          onPressed: () {
            if (viewModel.isSuccess) {
              viewModel.data;
              context.pop();
            }
          },
          child: Text(context.tr!.done.toUpperCase()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: CustomDevisForm(scheme: scheme, theme: theme, style: style),
      ),
    );
  }
}

class CustomDevisForm extends ConsumerWidget {
  const CustomDevisForm({
    super.key,
    required this.scheme,
    required this.theme,
    required this.style,
  });

  final ColorScheme scheme;
  final ThemeData theme;
  final TextTheme style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produits = ref.watch(selectedProduitsProvider); // list of Produit
    final total = produits.fold<double>(
      0,
      (prev, produit) =>
          prev + (produit.price.value ?? 0) * (produit.quantity.quantity ?? 1),
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImagePickerCard(scheme: scheme, style: style, theme: theme),
          const SizedBox(height: 24),

          TextFormField(
            decoration: InputDecoration(labelText: context.tr!.title),
          ),
          const SizedBox(height: 24),

          TextFormField(
            minLines: 5,
            maxLines: 10,
            decoration: InputDecoration(labelText: context.tr!.description),
          ),
          const SizedBox(height: 24),

          // Dynamic product list preview
          ...produits.map(
            (p) => ListTile(
              title: Text(p.name),
              subtitle: Text("${p.quantity} × ${p.formattedPrice}"),
              trailing: Text(p.formattedTotalPrice),
            ),
          ),
          const Divider(),

          // Total
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${context.tr!.total}: \$${total.toStringAsFixed(2)}",
              style: style.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImagePickerCard extends ConsumerWidget {
  const _ImagePickerCard({
    required this.scheme,
    required this.style,
    required this.theme,
  });

  final ColorScheme scheme;
  final TextTheme style;
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          // Implement image picker logic here
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo, color: scheme.onPrimaryContainer),
            const SizedBox(height: 8),
            Text(
              context.tr!.pickImage.toUpperCase(),
              style: style.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
