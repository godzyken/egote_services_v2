import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/get_all_event/get_all_event.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/get_all_event/get_all_event_state.dart';
import 'package:egote_services_v2/features/auth/domain/service/check_out_user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotrue/src/types/types.dart';
import 'package:mocktail/mocktail.dart';

class CheckOutUserServiceMock extends Mock implements CheckOutUserService {}

void main() {
  group('Get Cube User Event', () {
    test('create user with firebase', () async {
      final checkoutService = CheckOutUserServiceMock();
      await checkoutService.createCubeUserFromFirebase();
      verify(() => checkoutService.createCubeUserFromFirebase()).called(1);
    });

    test('get Host Language', () async {
      final checkoutService = CheckOutUserServiceMock();

      when(() => checkoutService.getHostLanguage())
          .thenAnswer((_) async => 'fr');

      await checkoutService.getHostLanguage();
      verify(() => checkoutService.getHostLanguage()).called(1);
    });

    test('Get All Event', () async {
      final checkoutService = CheckOutUserServiceMock();

      await getAllEvent.run(checkoutService);
      verify(() => checkoutService.getAll).called(1);
    });

    test('Get sign in with oauth provider google', () async {
      final checkoutService = CheckOutUserServiceMock();
      OAuthProvider provider = OAuthProvider.google;
      when(() => checkoutService.signInWithOAuth(provider))
          .thenThrow(Exception());

      final result = await getAllEventChain.run(checkoutService);

      expect(result, isA<QueryGetAllEventError>());
    });

    test('Create one', () async {
      final checkoutService = CheckOutUserServiceMock();

      final cubeUser = CubeUser();

      when(() => checkoutService.createCubeUserFromFirebase())
          .thenAnswer((_) async => cubeUser);

      final result = await getAllEventChain.run(checkoutService);

      if (result case SuccessGetAllEventState(cubeUser: final cubeUserList)) {
        expect(cubeUserList, [cubeUser]);
      } else {
        fail("Not an instance of SuccessGetAllEventState");
      }
    });
  });
}
