class ChantierEntity {
  final int id;
  final int clientId;
  final String title;
  final String description;
  final String status;
  final DateTime createdAt;

  const ChantierEntity({
    required this.id,
    required this.clientId,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
  });

  ChantierEntity copyWith({
    int? id,
    int? clientId,
    String? title,
    String? description,
    String? status,
    DateTime? createdAt,
  }) {
    return ChantierEntity(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ChantierEntity.fromJson(Map<String, dynamic> json) {
    return ChantierEntity(
      id: json['id'] as int? ?? 0,
      clientId: json['client_id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      status: json['status'] as String? ?? 'active',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'client_id': clientId,
    'title': title,
    'description': description,
    'status': status,
    'created_at': createdAt.toIso8601String(),
  };
}
