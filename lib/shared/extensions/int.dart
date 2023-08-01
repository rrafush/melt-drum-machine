extension BPMDivision on int {
  Duration durationOfBeat() {
    final result = const Duration(minutes: 1).inMicroseconds / this;
    return Duration(microseconds: result.toInt());
  }
}
