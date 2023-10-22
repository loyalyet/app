import 'package:hive/hive.dart';
import 'package:loyalyet_app/modules/site/site.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

Future<SiteRepository<T>> createHiveSiteRepository<T extends SiteData>({
  required SiteId siteId,
}) async {
  final box = await Hive.openBox<T>(siteId.name);
  return _HiveSiteRepository(box: box);
}

class _HiveSiteRepository<T extends SiteData> extends SiteRepository<T> {
  _HiveSiteRepository({
    required this.box,
  });

  final Box<T> box;

  @override
  Future<T?> getSiteData(String userId) async {
    return box.get(userId);
  }

  @override
  Future<void> putSiteData(String userId, T value) {
    return box.put(userId, value);
  }
}
