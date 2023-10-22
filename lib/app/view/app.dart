import 'package:flutter/material.dart';
import 'package:loyalyet_app/config/route/route.dart';
import 'package:loyalyet_app/l10n/l10n.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Widget app = MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      supportedLocales: AppLocalizations.supportedLocales,
    );

    // ignore: join_return_with_assignment
    app = StorageApp(child: app);

    return app;
  }
}
