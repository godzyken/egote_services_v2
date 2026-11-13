import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/chantier_colors.dart';

class BatTrackPage extends ConsumerStatefulWidget {
  const BatTrackPage({super.key, required this.chantierId});

  final String chantierId;

  @override
  ConsumerState<BatTrackPage> createState() => _BatTrackPageState();
}

class _BatTrackPageState extends ConsumerState<BatTrackPage> {
  final List<BatTrackPhoto> _photos = [
    BatTrackPhoto(
      title: 'Gros œuvre - Fondation A',
      date: '10 Nov 2026',
      progress: 100,
      imageUrl:
          'https://images.unsplash.com/photo-1541888946425-d0fbb197824b?w=600',
    ),
    BatTrackPhoto(
      title: 'Charpente & Toiture',
      date: '14 Nov 2026',
      progress: 75,
      imageUrl:
          'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=600',
    ),
    BatTrackPhoto(
      title: 'Isolation & Plâtrerie',
      date: 'En cours',
      progress: 40,
      imageUrl:
          'https://images.unsplash.com/photo-1581094288338-2314dddb7ece?w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChantierColors.background,
      appBar: AppBar(
        title: Text('Bat Track — Chantier #${widget.chantierId}'),
        backgroundColor: ChantierColors.background,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ChantierColors.card,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Avancement Global Bat Track',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '71%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: ChantierColors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const LinearProgressIndicator(
                    value: 0.71,
                    minHeight: 10,
                    backgroundColor: ChantierColors.orangePale,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ChantierColors.orange,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Suivi photographique certifié et validation par jalon d’avancement.',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Journal Photos & Jalons',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ChantierColors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Ouverture de l’appareil photo Bat Track...',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.camera_alt_rounded, size: 18),
                label: const Text('Ajouter Photo'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._photos.map(
            (photo) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: ChantierColors.card,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.network(
                      photo.imageUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        color: Colors.grey.shade200,
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              photo.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Date : ${photo.date}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Chip(
                          backgroundColor: ChantierColors.orangePale,
                          label: Text(
                            '${photo.progress}%',
                            style: const TextStyle(
                              color: ChantierColors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

class BatTrackPhoto {
  BatTrackPhoto({
    required this.title,
    required this.date,
    required this.progress,
    required this.imageUrl,
  });

  final String title;
  final String date;
  final int progress;
  final String imageUrl;
}
