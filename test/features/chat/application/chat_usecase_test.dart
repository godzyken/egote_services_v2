import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('Chat Feature - Send Message Use Case', () {
    late MockChatRepository mockChatRepository;

    setUp(() {
      mockChatRepository = MockChatRepository();
    });

    test('should send text message', () async {
      // Arrange
      const conversationId = 'conv_123';
      const messageText = 'Bonjour, comment ça va?';
      const senderId = 'user_123';

      final mockMessage = MockMessage.create(
        id: 'msg_1',
        conversationId: conversationId,
        senderId: senderId,
        text: messageText,
      );

      when(() => mockChatRepository.sendMessage(
            conversationId: conversationId,
            senderId: senderId,
            text: messageText,
          )).thenAnswer((_) async => mockMessage);

      // Act
      final result = await mockChatRepository.sendMessage(
        conversationId: conversationId,
        senderId: senderId,
        text: messageText,
      );

      // Assert
      expect(result, isNotNull);
      expect(result['text'], messageText);
      expect(result['senderId'], senderId);
      expect(result['conversationId'], conversationId);
    });

    test('should send message with attachments', () async {
      // Arrange
      const conversationId = 'conv_123';
      const senderId = 'user_123';
      const attachmentUrl = 'https://example.com/photo.jpg';

      final mockMessage = MockMessage.create(
        id: 'msg_2',
        conversationId: conversationId,
        senderId: senderId,
        attachments: [attachmentUrl],
      );

      when(() => mockChatRepository.sendMessage(
            conversationId: conversationId,
            senderId: senderId,
            attachments: [attachmentUrl],
          )).thenAnswer((_) async => mockMessage);

      // Act
      final result = await mockChatRepository.sendMessage(
        conversationId: conversationId,
        senderId: senderId,
        attachments: [attachmentUrl],
      );

      // Assert
      expect(result['attachments'], isNotNull);
      expect((result['attachments'] as List).length, 1);
      expect(result['attachments'][0], attachmentUrl);
    });

    test('should handle message delivery failures', () async {
      // Arrange
      const conversationId = 'conv_invalid';
      const senderId = 'user_123';

      when(() => mockChatRepository.sendMessage(
            conversationId: conversationId,
            senderId: senderId,
            text: 'Test',
          )).thenThrow(Exception('Conversation not found'));

      // Act & Assert
      expect(
        () => mockChatRepository.sendMessage(
          conversationId: conversationId,
          senderId: senderId,
          text: 'Test',
        ),
        throwsException,
      );
    });
  });

  group('Chat Feature - Receive Messages Use Case', () {
    late MockChatRepository mockChatRepository;

    setUp(() {
      mockChatRepository = MockChatRepository();
    });

    test('should receive message stream', () async {
      // Arrange
      const conversationId = 'conv_123';
      final mockMessages = [
        MockMessage.create(id: 'msg_1', text: 'First message'),
        MockMessage.create(id: 'msg_2', text: 'Second message'),
      ];

      when(() => mockChatRepository.getMessageStream(conversationId))
          .thenAnswer((_) => Stream.fromIterable(mockMessages));

      // Act
      final messageStream =
          mockChatRepository.getMessageStream(conversationId);
      final messages = await messageStream.toList();

      // Assert
      expect(messages.length, 2);
      expect(messages[0]['text'], 'First message');
      expect(messages[1]['text'], 'Second message');
    });

    test('should handle real-time updates', () async {
      // Arrange
      const conversationId = 'conv_123';
      var updateCount = 0;

      final mockMessages = [
        MockMessage.create(id: 'msg_1', text: 'Update 1'),
        MockMessage.create(id: 'msg_2', text: 'Update 2'),
        MockMessage.create(id: 'msg_3', text: 'Update 3'),
      ];

      when(() => mockChatRepository.getMessageStream(conversationId))
          .thenAnswer((_) {
        return Stream.fromIterable(mockMessages).map((msg) {
          updateCount++;
          return msg;
        });
      });

      // Act
      final messageStream =
          mockChatRepository.getMessageStream(conversationId);
      await messageStream.toList();

      // Assert
      expect(updateCount, 3);
    });

    test('should mark messages as read', () async {
      // Arrange
      const messageId = 'msg_123';
      const userId = 'user_123';

      final readMessage = MockMessage.create(
        id: messageId,
        isRead: true,
        readBy: [userId],
      );

      when(() => mockChatRepository.markMessageAsRead(messageId, userId))
          .thenAnswer((_) async => readMessage);

      // Act
      final result = await mockChatRepository.markMessageAsRead(messageId, userId);

      // Assert
      expect(result['isRead'], true);
      expect((result['readBy'] as List).contains(userId), true);
    });
  });

  group('Chat Feature - Conversation Management', () {
    late MockChatRepository mockChatRepository;

    setUp(() {
      mockChatRepository = MockChatRepository();
    });

    test('should list conversations', () async {
      // Arrange
      const userId = 'user_123';
      final mockConversations = [
        MockConversation.create(id: 'conv_1', participantNames: ['Alice']),
        MockConversation.create(id: 'conv_2', participantNames: ['Bob']),
      ];

      when(() => mockChatRepository.getConversations(userId))
          .thenAnswer((_) async => mockConversations);

      // Act
      final result = await mockChatRepository.getConversations(userId);

      // Assert
      expect(result.length, 2);
      expect(result[0]['id'], 'conv_1');
      expect(result[1]['id'], 'conv_2');
    });

    test('should create new conversation', () async {
      // Arrange
      const participantIds = ['user_1', 'user_2'];
      const title = 'Projet Rénovation';

      final newConversation = MockConversation.create(
        id: 'conv_new',
        title: title,
        participants: participantIds,
      );

      when(() => mockChatRepository.createConversation(
            participants: participantIds,
            title: title,
          )).thenAnswer((_) async => newConversation);

      // Act
      final result = await mockChatRepository.createConversation(
        participants: participantIds,
        title: title,
      );

      // Assert
      expect(result['id'], isNotNull);
      expect(result['title'], title);
      expect((result['participants'] as List).length, 2);
    });

    test('should delete conversation', () async {
      // Arrange
      const conversationId = 'conv_123';

      when(() => mockChatRepository.deleteConversation(conversationId))
          .thenAnswer((_) async => true);

      // Act
      final result = await mockChatRepository.deleteConversation(conversationId);

      // Assert
      expect(result, true);
      verify(() => mockChatRepository.deleteConversation(conversationId))
          .called(1);
    });
  });
}

class MockChatRepository {
  Future<Map<String, dynamic>> sendMessage({
    required String conversationId,
    required String senderId,
    String? text,
    List<String>? attachments,
  }) async {
    throw UnimplementedError();
  }

  Stream<Map<String, dynamic>> getMessageStream(String conversationId) {
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> markMessageAsRead(
      String messageId, String userId) async {
    throw UnimplementedError();
  }

  Future<List<Map<String, dynamic>>> getConversations(String userId) async {
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> createConversation({
    required List<String> participants,
    String? title,
  }) async {
    throw UnimplementedError();
  }

  Future<bool> deleteConversation(String conversationId) async {
    throw UnimplementedError();
  }
}

class MockMessage {
  static Map<String, dynamic> create({
    String? id,
    String? conversationId,
    String? senderId,
    String? text,
    List<String>? attachments,
    bool isRead = false,
    List<String>? readBy,
  }) {
    return {
      'id': id ?? 'msg_default',
      'conversationId': conversationId ?? 'conv_default',
      'senderId': senderId ?? 'user_default',
      'text': text,
      'attachments': attachments ?? [],
      'isRead': isRead,
      'readBy': readBy ?? [],
      'timestamp': DateTime.now().toString(),
    };
  }
}

class MockConversation {
  static Map<String, dynamic> create({
    String? id,
    String? title,
    List<String>? participants,
    List<String>? participantNames,
  }) {
    return {
      'id': id ?? 'conv_default',
      'title': title ?? 'Default Conversation',
      'participants': participants ?? [],
      'participantNames': participantNames ?? [],
      'createdAt': DateTime.now().toString(),
      'lastMessageAt': DateTime.now().toString(),
    };
  }
}
