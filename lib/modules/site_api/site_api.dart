import 'package:loyalyet_app/modules/site/site.dart';
import 'package:loyalyet_app/modules/site_api/thecoffeehouse.com/v5/tch_v5_api.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

abstract class SiteApi<T1 extends CredentialsData, T2 extends SiteData> {
  SiteApi({
    required this.siteId,
    required this.storage,
    required CredentialsDataUnmarshaler<T1> unmarshaler,
    required this.userId,
    required this.version,
  }) : _unmarshaler = unmarshaler;

  final SiteId siteId;

  final StorageRepositoryFactory storage;

  final CredentialsDataUnmarshaler<T1> _unmarshaler;

  final String userId;

  final int version;

  T1? _credsData;

  CredentialsRepository<T1>? _credsRepo;

  T2? _siteData;

  SiteRepository<T2>? _siteRepo;

  Future<T1?> get credsData async {
    final repo = await credsRepo;
    // this is not thread safe
    return _credsData ??= await repo.getCredentialsData(userId);
  }

  Future<CredentialsRepository<T1>> get credsRepo async {
    // this is not thread safe
    return _credsRepo ??= await storage.createCredentialsRepository(
      siteId: siteId,
      unmarshaler: _unmarshaler,
    );
  }

  Future<T2?> get siteData async {
    final repo = await siteRepo;
    // this is not thread safe
    return _siteData ??= await repo.getSiteData(userId);
  }

  Future<SiteRepository<T2>> get siteRepo async {
    // this is not thread safe
    return _siteRepo ??= await storage.createSiteRepository(
      siteId: siteId,
    );
  }

  static SiteApi create({
    required SiteId siteId,
    required StorageRepositoryFactory storage,
    required String userId,
  }) {
    switch (siteId) {
      case SiteId.theCoffeeHouse:
        return TheCoffeeHouseV5(
          siteId: siteId,
          storage: storage,
          userId: userId,
        );
    }
  }
}
