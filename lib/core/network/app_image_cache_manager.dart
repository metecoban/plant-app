import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final class AppImageCacheManager {
  const AppImageCacheManager._();

  static const _cacheKey = 'plantAppImageCache';

  static final CacheManager instance = CacheManager(
    Config(
      _cacheKey,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 200,
      repo: JsonCacheInfoRepository(databaseName: _cacheKey),
    ),
  );
}
