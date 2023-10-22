import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

class StorageApp extends StatelessWidget {
  const StorageApp({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<StorageRepositoryFactory>(
          create: (_) => const StorageRepositoryFactory(),
        ),
      ],
      child: child,
    );
  }
}
