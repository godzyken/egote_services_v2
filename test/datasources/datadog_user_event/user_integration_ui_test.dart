import 'package:egote_services_v2/features/auth/application/controller/user_controller.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_controller_state.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/profile_screen.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/userscreens/update_user_dialog_screen.dart';
import 'package:egote_services_v2/features/common/presentation/views/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserController extends Mock implements UserController {}

class MockUserControllerState extends Mock implements UserControllerState {}

void main() {
  late MockUserController mockUserController;
  late MockUserControllerState mockUserControllerState;
  const userId = 'user-123';

  setUp(() {
    mockUserController = MockUserController();
    mockUserControllerState = MockUserControllerState();
  });

  testWidgets('✅ Displays user name when profile loads',
      (WidgetTester tester) async {
    // Arrange
    final user = UserEntityModel(
        email: 'jaune@gmail.com',
        avatarUrl:
            'https://www.shutterstock.com/image-illustration/very-big-size-man-without-600w-126920099.jpg',
        name: 'Jane Doe',
        id: UserId(value: int.parse(userId)),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        phoneConfirmedAt: DateTime.now(),
        emailConfirmedAt: DateTime.now(),
        lastSignInAt: DateTime.now(),
        role: 'user',
        isComplete: true,
        externalId: userId,
        phone: '09994554545',
        externalLink: 'google.com');
    when(() => mockUserController.loadUserProfile(userId))
        .thenAnswer((_) async => user);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userControllerProvider.overrideWithValue(mockUserController),
        ],
        child: MaterialApp(
          home: ProfileScreen(uid: userId, pid: userId),
        ),
      ),
    );

    // Act
    await tester.pump(); // Start future
    await tester
        .pump(const Duration(milliseconds: 300)); // Wait for FutureBuilder

    // Assert
    expect(find.text('👤 Jane Doe'), findsOneWidget);
  });

  testWidgets('❌ Displays error when profile fails',
      (WidgetTester tester) async {
    // Arrange
    when(() => mockUserController.loadUserProfile(userId))
        .thenThrow(Exception('User not found'));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          userControllerProvider.overrideWithValue(mockUserController),
        ],
        child: MaterialApp(
          home: ProfileScreen(uid: userId, pid: userId),
        ),
      ),
    );

    // Act
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    // Assert
    expect(find.textContaining('❌ Error:'), findsOneWidget);
    expect(find.textContaining('User not found'), findsOneWidget);
    expect(find.byType(ErrorScreen), findsOneWidget);
    expect(find.byType(Scaffold), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('✅ Displays full user profile when loaded',
      (WidgetTester tester) async {
    final mockUser = UserEntityModel(
      id: UserId(value: int.parse('uid123')),
      name: 'Alice Doe',
      email: 'alice@example.com',
      avatarUrl: 'https://example.com/avatar.jpg',
      externalLink: 'https://example.com/avatar.jpg',
      role: 'admin',
      phone: '09994554545',
      externalId: 'uid123',
      isComplete: true,
      createdAt: DateTime.timestamp(),
      updatedAt: DateTime.timestamp(),
      emailConfirmedAt: DateTime.timestamp(),
      phoneConfirmedAt: DateTime.timestamp(),
      lastSignInAt: DateTime.timestamp(),
    );
    when(() => mockUserControllerState.load(userId))
        .thenAnswer((_) async => mockUser);

    final container = ProviderContainer(overrides: [
      userControllerStateProvider.overrideWith(
        () => mockUserControllerState,
      )
    ]);

    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(
        home: UpdateUserDialogScreen(userId: 'uid123'),
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.text('👤 Alice Doe'), findsOneWidget);
    expect(find.text('📧 alice@example.com'), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
  });

  testWidgets('❌ Shows error state', (WidgetTester tester) async {
    final container = ProviderContainer(
      overrides: [
        userControllerStateProvider.overrideWith(
          () {
            return mockUserControllerState;
          },
        ),
      ],
    );

    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(
        home: UpdateUserDialogScreen(userId: 'uid-123'),
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.textContaining('❌'), findsOneWidget);
    expect(find.textContaining('Load failed'), findsOneWidget);
  });
}
