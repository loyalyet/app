import 'package:flutter/foundation.dart';

@immutable
abstract class SiteData {
  const SiteData();

  int get version;
}

abstract class SiteRepository<T extends SiteData> {
  Future<T?> getSiteData(String userId);
  Future<void> putSiteData(String userId, T value);
}
