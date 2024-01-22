import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider,
      Object? newValue,
      Object? previousValue,
      ProviderContainer container,
      ) {
    print('${provider.name ?? provider.runtimeType}: $newValue');
  }
}
