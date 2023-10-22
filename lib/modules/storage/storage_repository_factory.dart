import 'package:flutter/foundation.dart';
import 'package:loyalyet_app/modules/site/site.dart';
import 'package:loyalyet_app/modules/storage/engine/hive/hive_site_repository.dart';
import 'package:loyalyet_app/modules/storage/engine/secure_storage/secure_credentials_repository.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

@immutable
class StorageRepositoryFactory {
  const StorageRepositoryFactory();

  Future<CredentialsRepository<T>>
      createCredentialsRepository<T extends CredentialsData>({
    required SiteId siteId,
    required CredentialsDataUnmarshaler<T> unmarshaler,
  }) =>
          createSecureCredentialsRepository(
            siteId: siteId,
            unmarshaler: unmarshaler,
          );

  Future<SiteRepository<T>> createSiteRepository<T extends SiteData>({
    required SiteId siteId,
  }) =>
      createHiveSiteRepository(siteId: siteId);
}
