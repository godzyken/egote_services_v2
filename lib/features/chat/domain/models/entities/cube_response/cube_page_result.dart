class PagedResult<T> {
  int? currentPage;
  List<T>? items;
  int? limit;
  int? perPage;
  int? skip;
  int? totalEntries;
}
