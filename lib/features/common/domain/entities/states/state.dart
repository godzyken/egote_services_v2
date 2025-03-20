import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
sealed class State<T> with _$State<T> {
  const State._();
  @FreezedUnionValue("init")
  const factory State.init() = init<T>;
  @FreezedUnionValue("loading")
  const factory State.loading() = _loading;
  @FreezedUnionValue("success")
  const factory State.success(final T data) = _success<T>;
  @FreezedUnionValue("error")
  const factory State.error(final Exception exception) = _error;

  bool get isInit => maybeWhen(init: () => true, orElse: () => false);

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  T? get data => maybeWhen(success: (data) => data, orElse: () => null);

  List<T>? get dataStream => mapOrNull(
        success: (_) => []..breakI((t) => isSuccess),
        loading: (value) => []..lastOption.pure(data),
        error: (value) => []..all((t) => false),
        init: (value) => []..init,
      );
}
