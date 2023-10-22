import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

extension StorageContext on BuildContext {
  StorageRepositoryFactory get storage =>
      RepositoryProvider.of<StorageRepositoryFactory>(this);
}
