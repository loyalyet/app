import 'package:loyalyet_app/modules/storage/engine/hive/init_hive.dart';

export 'credentials_data.dart';
export 'site_data.dart';
export 'storage_app.dart';
export 'storage_context.dart';
export 'storage_repository_factory.dart';

Future<void> initStorage() async {
  await initHive();
}
