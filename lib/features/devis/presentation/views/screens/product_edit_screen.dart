import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:egote_services_v2/features/devis/presentation/states/entities/product_states/produit_entity_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductEditScreen extends ConsumerStatefulWidget {
  const ProductEditScreen({required this.produit, super.key});

  final Produit produit;

  @override
  ConsumerState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends ConsumerState<ProductEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late Produit editProduit;

  @override
  void initState() {
    super.initState();
    editProduit = widget.produit;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final form = _formKey.currentState!;
      form.save();
      form.validate();
      ref.read(editProduitProvider.notifier).editProduit(widget.produit);
      form.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final editProduitState = ref.watch(editProduitProvider);
    return editProduitState.when(
        data: (produit) => Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextFormField(
                    initialValue: produit?.produitName,
                    decoration:
                        const InputDecoration(labelText: 'Dénomination'),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Entrer une dénomination'
                        : null,
                    onChanged: (value) {
                      setState(() {
                        produit = produit?.copyWith(produitName: value);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: produit!.description,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Entrer un titre' : null,
                    onChanged: (value) {
                      setState(() {
                        produit = produit!.copyWith(description: value);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: produit!.category,
                    decoration: const InputDecoration(labelText: 'Catégorie'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Entrer une Catégorie' : null,
                    onChanged: (value) {
                      setState(() {
                        produit = produit!.copyWith(category: value);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: produit!.material,
                    decoration: const InputDecoration(labelText: 'Material'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Entrer une matière' : null,
                    onChanged: (value) {
                      setState(() {
                        produit = produit!.copyWith(material: value);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: produit?.color,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Entrer une Couleur' : null,
                    onChanged: (value) {
                      setState(() {
                        produit = produit?.copyWith(color: value);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: produit?.size,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Entrer une taille/Dimention'
                        : null,
                    onChanged: (value) {
                      setState(() {
                        produit = produit?.copyWith(size: value);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: produit?.price.toString(),
                    decoration:
                        const InputDecoration(labelText: 'Prix unitaire'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Entrer un Prix' : null,
                    onChanged: (value) {
                      final price = double.tryParse(value);
                      setState(() {
                        produit = produit?.copyWith(price: price!);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: produit?.quantity.toString(),
                    decoration: const InputDecoration(labelText: 'Quantité'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Entrer une quantité' : null,
                    onChanged: (value) {
                      final quantity = int.tryParse(value);
                      setState(() {
                        produit = produit?.copyWith(quantity: quantity!);
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() ?? false) {
                        await ref
                            .read(editProduitProvider.notifier)
                            .saveChanges(produit!);
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    child: const Text('Enregistrer'),
                  ),
                ]))),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stackTrace) =>
            Center(child: Text('Error: $error')));
  }
}
