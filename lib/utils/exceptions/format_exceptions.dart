class TFormatException implements Exception {
  const TFormatException();

  String get message => 'The provided format is invalid.';
}
