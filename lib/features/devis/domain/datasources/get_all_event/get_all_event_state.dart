import '../../entities/devis_model/devis_model_entity.dart';

part 'get_all_event_error.dart';

sealed class GetAllEventState {
  const GetAllEventState();
}

class SuccessGetAllEventState extends GetAllEventState {
  final List<DevisModelEntity> devisModelEntity;

  const SuccessGetAllEventState(this.devisModelEntity);
}
