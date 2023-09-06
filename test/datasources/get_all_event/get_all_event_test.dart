import 'package:egote_services_v2/features/devis/domain/datasources/get_all_event/get_all_event.dart';
import 'package:egote_services_v2/features/devis/domain/datasources/get_all_event/get_all_event_state.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/services/check_out_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CheckoutServiceMock extends Mock implements CheckoutService {}

void main() {
  group('getAllEvent', () {
    test('should call "getAll" from CheckoutService one time', () async {
      final checkoutService = CheckoutServiceMock();

      await getAllEvent.run(checkoutService);

      verify(() => checkoutService.getAll).called(1);
    });

    test('should return QueryGetAllEventError when getAll throws', () async {
      final checkoutService = CheckoutServiceMock();
      when(() => checkoutService.getAll).thenThrow(Exception());

      final result = await getAllEvent.run(checkoutService);

      expect(result, isA<QueryGetAllEventError>());
    });

    test('should return SuccessGetAllEventState when the request is successful',
        () async {
      final service = CheckoutServiceMock();
      when(
        () => service.getAll,
      ).thenAnswer((invocation) async => []);

      final result = await getAllEvent.run(service);

      expect(result, isA<SuccessGetAllEventState>());
    });

    test(
        'should return the list returned by getAll when the request is successful',
        () async {
      final service = CheckoutServiceMock();

      final devisEntity = DevisModelEntity.initialize(
          id: const DevisId(id: 0), createdAt: DateTime(2023));
      when(
        () => service.getAll,
      ).thenAnswer((invocation) async => [devisEntity]);

      final result = await getAllEvent.run(service);

      if (result
          case SuccessGetAllEventState(devisModelEntity: final devisList)) {
        expect(devisList, [devisEntity]);
      } else {
        fail("Not an instance of SuccessGetAllEventState");
      }
    });
  });
}
