import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:egote_services_v2/features/devis/presentation/states/entities/product_states/produit_entity_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductEditScreen extends ConsumerStatefulWidget {
  const ProductEditScreen({required this.produitId, super.key});

  final String produitId;

  @override
  ConsumerState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends ConsumerState<ProductEditScreen> {
  final _formKey = GlobalKey<FormState>();

  late final Produit editProduit;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final form = _formKey.currentState!;
      form.save();
      form.validate();
      if (widget.produitId == editProduit.id.toString()) {
        ref.read(editProduitProvider.notifier).editProduit(editProduit);
      }
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
                    initialValue: produit?.name,
                    decoration:
                        const InputDecoration(labelText: 'Dénomination'),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Entrer une dénomination'
                        : null,
                    onChanged: (value) {
                      setState(() {
                        produit = produit?.copyWith(name: value);
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: produit!.manufacturer,
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Entrer un Fabricant' : null,
                    onChanged: (value) {
                      setState(() {
                        produit = produit!.copyWith(manufacturer: value);
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
                        produit?.price == price;
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
                        produit?.quantity == quantity;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async => await saveChange(produit!, context),
                    child: const Text('Enregistrer'),
                  ),
                ]))),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stackTrace) =>
            Center(child: Text('Error: $error')));
  }

  Future<void> saveChange(Produit produit, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await ref.read(editProduitProvider.notifier).saveChanges(produit);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}
