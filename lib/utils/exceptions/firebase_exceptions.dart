class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'weak-password':
        return 'Please enter a stronger password.';
      case 'email-already-in-use':
        return 'An account already exists for that email.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Incorrect password, please try again.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }
}

class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'network-request-failed':
        return 'Network request failed. Please check your connection.';
      default:
        return 'Firebase error occurred. Please try again.';
    }
  }
}
