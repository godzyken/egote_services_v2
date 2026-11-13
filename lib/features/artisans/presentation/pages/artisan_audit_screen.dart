import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtisanAuditScreen extends ConsumerStatefulWidget {
  const ArtisanAuditScreen({
    super.key,
    required this.artisanName,
    required this.trade,
    required this.score,
    required this.avatarUrl,
    required this.siret,
    required this.websiteUrl,
    required this.seoScore,
    required this.rioScore,
  });

  final String artisanName;
  final String trade;
  final int score;
  final String avatarUrl;
  final String siret;
  final String websiteUrl;
  final int seoScore;
  final int rioScore;

  @override
  ConsumerState<ArtisanAuditScreen> createState() => _ArtisanAuditScreenState();
}

class _ArtisanAuditScreenState extends ConsumerState<ArtisanAuditScreen> {
  bool _isQuoteValidated = false;

  void _validateQuoteAndTriggerChantier() {
    setState(() {
      _isQuoteValidated = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '✨ Devis validé avec succès ! Chantier BTP généré et synchronisé.',
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Audit & Stratégie — ${widget.artisanName}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.verified_rounded, color: Colors.green),
            tooltip: 'SIRET & SEO Vérifiés',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. Profil & Règles d'Intégration (SIRET, SEO, RIO)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.colorScheme.primary, theme.colorScheme.tertiary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(widget.avatarUrl),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.artisanName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.trade,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildBadge('SIRET validé', Colors.greenAccent),
                          const SizedBox(width: 8),
                          _buildBadge(
                            'SEO: ${widget.seoScore}%',
                            Colors.amberAccent,
                          ),
                          const SizedBox(width: 8),
                          _buildBadge(
                            'RIO: ${widget.rioScore}',
                            Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 2. Stratégie, Résultats & Conseils IA
          Text(
            'Stratégie, Résultats & Conseils IA',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: isDark
                  ? theme.colorScheme.surfaceContainerHighest
                  : Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      color: Colors.orange,
                      size: 22,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Diagnostic Stratégique IA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  '• Stratégie actuelle : Positionnement haut de gamme éco-rénovation (RGE).\n'
                  '• Résultats : +24% de conversion sur les devis de toiture et isolation.\n'
                  '• 💡 Conseil IA de développement : Développer le canal B2B local en valorisant vos certifications RGE sur votre site web pour capter les subventions MaPrimeRenov.',
                  style: TextStyle(fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 3. Outils Puissants : Évaluation de CA & Audit de Rentabilité
          Text(
            'Audit Financier & Rentabilité (Marché Ciblé)',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  title: 'CA Prévisionnel',
                  value: '185 000 €',
                  subtitle: '+18% vs N-1',
                  color: Colors.green,
                  icon: Icons.trending_up_rounded,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildMetricCard(
                  title: 'Potentiel Rentabilité',
                  value: '28.4%',
                  subtitle: 'Optimisé (Marché BTP)',
                  color: Colors.indigo,
                  icon: Icons.pie_chart_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 4. Validation de Devis & Déclenchement Chantier
          Text(
            'Devis en Cours & Déclenchement de Chantier',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: isDark
                  ? theme.colorScheme.surfaceContainerHighest
                  : Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Devis #DEV-2026-089',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Rénovation Énergétique Villa — 14 500 €',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _isQuoteValidated
                            ? Colors.green.withValues(alpha: 0.15)
                            : Colors.orange.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _isQuoteValidated
                            ? 'Validé & Chantier Créé'
                            : 'En attente signature',
                        style: TextStyle(
                          color: _isQuoteValidated
                              ? Colors.green
                              : Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isQuoteValidated
                          ? Colors.grey
                          : theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _isQuoteValidated
                        ? null
                        : _validateQuoteAndTriggerChantier,
                    icon: Icon(
                      _isQuoteValidated
                          ? Icons.check_circle_rounded
                          : Icons.construction_rounded,
                    ),
                    label: Text(
                      _isQuoteValidated
                          ? 'Chantier Actif dans le Hub'
                          : 'Valider le Devis & Déclencher le Chantier',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Icon(icon, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
