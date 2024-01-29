class CardsProviderConnectionError implements Exception {
  const CardsProviderConnectionError([
    this.code = 'unknown',
    this.message = 'An unknown exception occurred.',
  ]);

  factory CardsProviderConnectionError.fromCode(String code) {
    switch (code) {
      case 'connection-error':
        return const CardsProviderConnectionError(
          'connection-error',
          'Connection error, please connect your device to the internet and retry.',
        );
      default:
        return const CardsProviderConnectionError();
    }
  }

  final String code;
  final String message;
}
