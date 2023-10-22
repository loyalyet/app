import 'package:hive_flutter/hive_flutter.dart';
import 'package:loyalyet_app/modules/site_api/thecoffeehouse.com/tch_site_data.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TheCoffeeHouseSiteDataAdapter());
}
