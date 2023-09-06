import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef VoidAsyncValue = AsyncValue<void>;

/*extension AsyncValueUi on VoidAsyncValue {
  bool get isLoading => this is AsyncLoading<void>;

  void showSnackBarOnError(BuildContext context) =>
      whenOrNull(error: (error, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
}*/
