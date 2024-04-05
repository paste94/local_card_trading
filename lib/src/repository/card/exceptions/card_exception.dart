class CardProviderConnectionError implements Exception {
  const CardProviderConnectionError([
    this.code = 'unknown',
    this.message = 'An unknown exception occurred.',
  ]);

  factory CardProviderConnectionError.fromCode(String code) {
    switch (code) {
      case 'connection-error':
        return const CardProviderConnectionError(
          'connection-error',
          'Connection error, please connect your device to the internet and retry.',
        );
      default:
        return const CardProviderConnectionError();
    }
  }

  final String code;
  final String message;
}
