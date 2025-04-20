import '../products/produit_model_entity.dart';

class ProduitTransaction {
  final String timestamp;
  final String action;
  final Produit produit;
  final double total;

  ProduitTransaction({
    required this.timestamp,
    required this.action,
    required this.produit,
    required this.total,
  });

  factory ProduitTransaction.fromJson(Map<String, dynamic> json) {
    return ProduitTransaction(
      timestamp: json['timestamp'] as String,
      action: json['action'] as String,
      produit: Produit.fromJson(json['produit']),
      total: (json['total'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'action': action,
        'produit': produit.toJson(),
        'total': total,
      };
}
