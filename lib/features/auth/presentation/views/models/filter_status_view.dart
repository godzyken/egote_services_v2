
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterKind{ all, available, unavailable, byId }

class FilterKindView extends StateNotifier<FilterKind> {
  FilterKindView() : super(FilterKind.all);
  
  filterByAll() => state = FilterKind.all;
  filterByAvailable() => state = FilterKind.available;
  filterByUnavailable() => state = FilterKind.unavailable;
  filterById(final int id) => state = FilterKind.byId;

  bool isFilterByAll() => state == FilterKind.all;
  bool isFilterByAvailable() => state == FilterKind.available;
  bool isFilterByUnavailable() => state == FilterKind.unavailable;
  bool isFilterById(final int id) => state == FilterKind.byId;
}

final filterKindViewModelStateNotifierProvider = StateNotifierProvider
    .autoDispose<FilterKindView, FilterKind>(
        (_) => FilterKindView());