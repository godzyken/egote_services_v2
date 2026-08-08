# 🧪 Test Strategy for Phase 1

## Overview
This document outlines the testing strategy for egote_services_v2 Phase 1 (Riverpod migration & baseline tests).

## Target Coverage
- **Phase 1 Goal**: 40% overall coverage
- **Auth Feature**: 35% of test cases
- **Devis Feature**: 20% of test cases
- **Chat Feature**: 20% of test cases

## Test Structure

### Test Hierarchy
```
test/
├── helpers/
│   └── test_utils.dart          # Common test utilities
├── mocks/
│   └── mock_auth.dart            # Mock services & data
├── features/
│   ├── auth/
│   │   └── application/
│   │       └── auth_usecase_test.dart       [9 test cases]
│   ├── devis/
│   │   └── application/
│   │       └── devis_usecase_test.dart      [9 test cases]
│   └── chat/
│       └── application/
│           └── chat_usecase_test.dart       [9 test cases]
├── widget_test.dart              # Basic widget test
└── datasources/
    └── get_all_event/            # Existing (incomplete)
```

## Tier 1: Critical Tests (Must Pass)

### Auth
- ✅ Login with valid credentials
- ✅ Login with invalid email
- ✅ Login with wrong password
- ✅ Persist session token
- ✅ Sign up account creation
- ✅ Reject weak password
- ✅ Reject duplicate email
- ✅ Load user profile
- ✅ Update user profile

### Devis
- ✅ Create devis with valid data
- ✅ Calculate totals correctly
- ✅ Apply discounts properly
- ✅ Fetch devis list
- ✅ Filter by status
- ✅ Sort by date
- ✅ Update devis status
- ✅ No update after acceptance
- ✅ Notification on status change

### Chat
- ✅ Send text message
- ✅ Send message with attachments
- ✅ Handle delivery failures
- ✅ Receive message stream
- ✅ Handle real-time updates
- ✅ Mark messages as read
- ✅ List conversations
- ✅ Create conversation
- ✅ Delete conversation

## Running Tests

### Run all tests
```bash
flutter test
```

### Run specific test file
```bash
flutter test test/features/auth/application/auth_usecase_test.dart
```

### Run with coverage
```bash
flutter test --coverage
# View coverage
lcov --list coverage/lcov.info
```

## Next Steps (Phase 2)

1. Implement domain/repository layer tests
2. Add provider/notifier tests
3. Add widget tests for UI components
4. Reach 60% coverage
5. Add integration tests for critical flows

## Notes

- Tests use `mocktail` for mocking
- Test cases are implemented with TODO placeholders for implementation
- Each test file targets 3 test groups with 3 test cases each
- Total: 27 test cases (placeholder) for 3 major features
