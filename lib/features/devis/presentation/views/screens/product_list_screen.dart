import 'package:egote_services_v2/features/devis/presentation/views/screens/product_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/products/produit_model_entity.dart';
import '../../../domain/providers/devis_providers.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produitsAsync = ref.watch(produitNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produits'),
      ),
      body: produitsAsync.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => ProduitFiche(produit: data[index]),
        ),
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ProduitFiche extends ConsumerWidget {
  final Produit produit;
  const ProduitFiche({super.key, required this.produit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: ListTile(
      title: Text(produit.produitName),
      subtitle: Text('${produit.sku} - ${produit.price}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _showEditModal(context, ref),
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () => _showDeleteDialog(context, ref),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      onTap: () => context.push('/${produit.sku}'),
    ));
  }

  void _showEditModal(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ProductEditScreen(produit: produit),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text('Supprimer le produit: ${produit.produitName}'),
                content: const Text(
                    'Êtes-vous sûr de vouloir supprimer ce produit ?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () {
                      ref
                          .read(produitNotifierProvider.notifier)
                          .deleteProduit(produit.sku);
                      Navigator.pop(context);
                    },
                    child: const Text('Supprimer'),
                  )
                ]));
  }
}
