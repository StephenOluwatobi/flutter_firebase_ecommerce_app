class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      default:
        return 'Platform error occurred. Please try again.';
    }
  }
}
