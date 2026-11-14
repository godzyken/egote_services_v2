class Trial {
  final String id;
  final String ruleName;
  final bool success;
  final String message;
  final List<String> nodeIds;
  final DateTime timestamp;

  const Trial({
    required this.id,
    required this.ruleName,
    required this.success,
    required this.message,
    this.nodeIds = const [],
    required this.timestamp,
  });

  Trial copyWith({
    String? id,
    String? ruleName,
    bool? success,
    String? message,
    List<String>? nodeIds,
    DateTime? timestamp,
  }) {
    return Trial(
      id: id ?? this.id,
      ruleName: ruleName ?? this.ruleName,
      success: success ?? this.success,
      message: message ?? this.message,
      nodeIds: nodeIds ?? this.nodeIds,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'ruleName': ruleName,
    'success': success,
    'message': message,
    'nodeIds': nodeIds,
    'timestamp': timestamp.toIso8601String(),
  };

  factory Trial.fromJson(Map<String, dynamic> json) {
    return Trial(
      id: json['id'] as String,
      ruleName: json['ruleName'] as String,
      success: json['success'] as bool,
      message: json['message'] as String,
      nodeIds: List<String>.from(json['nodeIds'] ?? []),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trial && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
