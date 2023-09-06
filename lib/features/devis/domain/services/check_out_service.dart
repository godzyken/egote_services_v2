import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';

abstract class CheckoutService {
  // this will succeed or throw an error
  Future<DevisModelEntity> update(String id);

  Future<void> delete(String id);

  Future<List<DevisModelEntity>> get getAll;
}
