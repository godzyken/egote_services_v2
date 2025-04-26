class CustomRepetitiveStackFrameFilter {
  final Set<String> _seenFrames = {};

  String filter(String stackTrace) {
    final lines = stackTrace.split('\n');
    final filtered = <String>[];

    for (final line in lines) {
      if (_seenFrames.add(line)) {
        filtered.add(line);
      }
    }

    return filtered.join('\n');
  }

  bool matchFrames(List<String> frames1, List<String> frames2) {
    return frames1.length == frames2.length &&
        List.generate(frames1.length, (i) => frames1[i] == frames2[i])
            .every((b) => b);
  }
}
