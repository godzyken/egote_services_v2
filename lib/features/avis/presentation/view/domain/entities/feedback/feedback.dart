class Feedback {
  final String id;
  final String? name;
  final String message;
  final String? photoUrl;
  final DateTime createdAt;
  final bool isAnonymous;

  Feedback({
    required this.id,
    this.name,
    required this.message,
    this.photoUrl,
    required this.createdAt,
    required this.isAnonymous,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'message': message,
      'photo_url': photoUrl,
      'created_at': createdAt.toIso8601String(),
      'is_anonymous': isAnonymous,
    };
  }

  static Feedback fromMap(Map<String, dynamic> map) {
    return Feedback(
      id: map['id'],
      name: map['name'],
      message: map['message'],
      photoUrl: map['photo_url'],
      createdAt: DateTime.parse(map['created_at']),
      isAnonymous: map['is_anonymous'],
    );
  }
}
