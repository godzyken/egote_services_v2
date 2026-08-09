import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterKind { all, available, unavailable, byId }

class FilterKindNotifier extends Notifier<FilterKind> {
  @override
  FilterKind build() {
    return FilterKind.all;
  }

  void filterByAll() => state = FilterKind.all;
  void filterByAvailable() => state = FilterKind.available;
  void filterByUnavailable() => state = FilterKind.unavailable;
  void filterById(final int id) => state = FilterKind.byId;

  bool isFilterByAll() => state == FilterKind.all;
  bool isFilterByAvailable() => state == FilterKind.available;
  bool isFilterByUnavailable() => state == FilterKind.unavailable;
  bool isFilterById(final int id) => state == FilterKind.byId;
}

final filterKindNotifierProvider =
NotifierProvider<FilterKindNotifier, FilterKind>(
  FilterKindNotifier.new,
  name: 'FilterKindNotifierProvider',
);