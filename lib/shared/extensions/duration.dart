extension DurationExtension on Duration {
  Duration fraction(int fractions) {
    final result = inMicroseconds / fractions;
    return Duration(microseconds: result.floor());
  }
}
