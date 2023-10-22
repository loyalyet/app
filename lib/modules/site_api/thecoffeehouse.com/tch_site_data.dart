import 'package:hive/hive.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

part 'tch_site_data.g.dart';

@HiveType(typeId: 0)
class TheCoffeeHouseSiteData extends SiteData {
  const TheCoffeeHouseSiteData({
    required this.version,
  });

  @HiveField(0)
  @override
  final int version;
}
