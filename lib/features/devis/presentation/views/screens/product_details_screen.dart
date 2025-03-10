import 'package:egote_services_v2/features/devis/domain/providers/devis_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/products/produit_model_entity.dart';

class ProduitDetails extends ConsumerWidget {
  const ProduitDetails({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produitAsync = ref.watch(produitDetailsProvider(id));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
        title: Text('Produit Details'),
      ),
      body: produitAsync.when(
        data: (data) => ProduitDetailsContent(produit: data),
        error: (error, stackTrace) => Center(
          child: ErrorWidget(error),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ProduitDetailsContent extends ConsumerWidget {
  final Produit produit;

  const ProduitDetailsContent({super.key, required this.produit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
          produit.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                produit.produitName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Description: ${produit.description}'),
              SizedBox(
                height: 10,
              ),
              Text('Prix: ${produit.price}'),
              SizedBox(
                height: 10,
              ),
              Text('SKU: ${produit.sku}'),
              SizedBox(
                height: 10,
              ),
              Text('Quantité: ${produit.quantity}'),
              SizedBox(
                height: 10,
              ),
              Text('Catégorie: ${produit.category}'),
              SizedBox(
                height: 10,
              ),
              Text('Brand: ${produit.brand}'),
            ]))
      ]),
    );
  }
}
