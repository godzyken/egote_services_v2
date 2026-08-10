import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class State<T> with _$State<T> {
  const State._();

  const factory State.initial() = _Initial<T>;
  const factory State.loading() = _Loading<T>;
  const factory State.success(final T data) = _Success<T>;
  const factory State.error(final Exception exception) = _Error<T>;

  bool get isInitial => maybeWhen(initial: () => true, orElse: () => false);

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  T? get data => maybeWhen(success: (data) => data, orElse: () => null);

  List<T>? get dataStream => mapOrNull(
        success: (s) => [s.data],
        loading: (_) => [],
        error: (_) => [],
        initial: (_) => [],
      );
}
