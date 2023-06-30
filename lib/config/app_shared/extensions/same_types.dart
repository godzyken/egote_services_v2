/// This is based on this StackOverflow answer:
/// https://stackoverflow.com/questions/67446069/dart-how-to-determine-nullable-generic-type-at-runtime/67456559#67456559
bool sameTypes<S, V>() {
  void func<X extends S>() {}
  // Dart spec says this is only true if S and V are "the same type".
  return func is void Function<X extends V>();
}