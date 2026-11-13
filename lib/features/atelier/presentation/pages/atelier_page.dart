import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AtelierPage extends ConsumerStatefulWidget {
  const AtelierPage({super.key});

  @override
  ConsumerState<AtelierPage> createState() => _AtelierPageState();
}

class _AtelierPageState extends ConsumerState<AtelierPage> {
  final List<MaterialItem> _materials = [
    MaterialItem(
      name: 'Béton Prêt à l’Emploi C25/30',
      category: 'Gros œuvre',
      price: '115 € / m³',
      stock: 'En stock (250 m³)',
      imageUrl:
          'https://images.unsplash.com/photo-1590069261209-f8e9b8642343?w=600',
    ),
    MaterialItem(
      name: 'Panneaux Laine de Roche 140mm',
      category: 'Isolation',
      price: '24.50 € / m²',
      stock: 'Stock faible (45 m²)',
      imageUrl:
          'https://images.unsplash.com/photo-1513694203232-719a280e022f?w=600',
    ),
    MaterialItem(
      name: 'Carrelage Grès Cérame 60x60',
      category: 'Finitions',
      price: '32.00 € / m²',
      stock: 'En stock (1 200 m²)',
      imageUrl:
          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=600',
    ),
    MaterialItem(
      name: 'Câble Électrique R02V 3G2.5',
      category: 'Électricité',
      price: '85.00 € / couronne',
      stock: 'En stock (40 couronnes)',
      imageUrl:
          'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atelier — Catalogue & Matériaux BTP'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher un matériau, une référence...',
              prefixIcon: const Icon(Icons.search_rounded),
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Catalogue Matériaux & Ressources',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ..._materials.map(
            (mat) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(18),
                    ),
                    child: Image.network(
                      mat.imageUrl,
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 110,
                        height: 110,
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              mat.category,
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            mat.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            mat.price,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.primary,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            mat.stock,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialItem {
  MaterialItem({
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.imageUrl,
  });

  final String name;
  final String category;
  final String price;
  final String stock;
  final String imageUrl;
}
