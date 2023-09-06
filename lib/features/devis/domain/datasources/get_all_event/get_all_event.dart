import 'package:egote_services_v2/features/devis/domain/datasources/get_all_event/get_all_event_state.dart';
import 'package:egote_services_v2/features/devis/domain/services/check_out_service.dart';
import 'package:fpdart/fpdart.dart';

final getAllEvent = ReaderTask<CheckoutService, GetAllEventState>.Do(
  (_) async {
    final executeQuery = await _(
      ReaderTask(
        (checkoutService) async => TaskEither.tryCatch(
          () => checkoutService.getAll,
          QueryGetAllEventError.new,
        ),
      ),
    );

    return _(ReaderTask(
      (_) => executeQuery
          .match<GetAllEventState>(
            identity,
            SuccessGetAllEventState.new,
          )
          .run(),
    ));
  },
);

final getAllEventChain = ReaderTask((CheckoutService checkoutService) =>
    TaskEither.tryCatch(() => checkoutService.getAll, QueryGetAllEventError.new)
        .match(identity, SuccessGetAllEventState.new)
        .run());
