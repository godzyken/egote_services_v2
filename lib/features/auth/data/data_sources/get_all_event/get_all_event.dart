import 'package:fpdart/fpdart.dart';

import '../../../domain/service/check_out_user_service.dart';
import 'get_all_event_state.dart';

final getAllEvent = ReaderTask<CheckOutUserService, GetAllAuthEventState>.Do(
  (rd) async {
    final executeQuery = await rd(
      ReaderTask(
        (checkoutService) async => TaskEither.tryCatch(
          () => checkoutService.getAll,
          QueryGetAllEventError.new,
        ),
      ),
    );

    return rd(ReaderTask(
      (_) => executeQuery
          .match<GetAllAuthEventState>(
            identity,
            SuccessGetAllEventState.new,
          )
          .run(),
    ));
  },
);

final getAllEventChain = ReaderTask((CheckOutUserService checkoutService) =>
    TaskEither.tryCatch(() => checkoutService.getAll, QueryGetAllEventError.new)
        .match(identity, SuccessGetAllEventState.new)
        .run());
