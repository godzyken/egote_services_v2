import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtisansPage extends ConsumerStatefulWidget {
  const ArtisansPage({super.key});

  @override
  ConsumerState<ArtisansPage> createState() => _ArtisansPageState();
}

class _ArtisansPageState extends ConsumerState<ArtisansPage> {
  final List<ArtisanItem> _artisans = [
    ArtisanItem(
      name: 'Marc Lefevre',
      trade: 'Gros Œuvre & Maçonnerie',
      score: 98,
      rating: 4.9,
      certifications: ['RGE', 'Qualibat'],
      completedProjects: 42,
      avatarUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
    ),
    ArtisanItem(
      name: 'Sophie Bernard',
      trade: 'Plomberie & Chauffage',
      score: 95,
      rating: 4.8,
      certifications: ['PG', 'Qualigaz'],
      completedProjects: 38,
      avatarUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
    ),
    ArtisanItem(
      name: 'Lucas Moreau',
      trade: 'Électricité Générale',
      score: 92,
      rating: 4.7,
      certifications: ['Qualifelec', 'IRVE'],
      completedProjects: 29,
      avatarUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Artisans — Réseau & Scoring BTP'),
        actions: [
          IconButton(
            icon: const Icon(Icons.verified_user_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary, theme.colorScheme.tertiary],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scoring & Fiabilité Artisans',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Évaluation basée sur les délais tenus, la conformité RGE et les retours de chantier.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Artisans Recommandés & Certifiés',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ..._artisans.map(
            (artisan) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
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
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(artisan.avatarUrl),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              artisan.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Score ${artisan.score}%',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          artisan.trade,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ...artisan.certifications.map(
                              (cert) => Container(
                                margin: const EdgeInsets.only(right: 6),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.secondaryContainer,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  cert,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        theme.colorScheme.onSecondaryContainer,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              artisan.rating.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
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

class ArtisanItem {
  ArtisanItem({
    required this.name,
    required this.trade,
    required this.score,
    required this.rating,
    required this.certifications,
    required this.completedProjects,
    required this.avatarUrl,
  });

  final String name;
  final String trade;
  final int score;
  final double rating;
  final List<String> certifications;
  final int completedProjects;
  final String avatarUrl;
}
