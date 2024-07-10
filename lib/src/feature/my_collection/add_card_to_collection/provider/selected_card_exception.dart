class SelectedCardException implements Exception {
  final String message;

  SelectedCardException(this.message);

  @override
  String toString() {
    return "SelectedCardException: $message";
  }
}
