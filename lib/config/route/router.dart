import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalyet_app/config/route/route_path.dart';
import 'package:loyalyet_app/modules/site/site.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => routeSiteList,
    ),
    GoRoute(
      path: routeSiteList,
      builder: (_, __) => BlocProvider(
        create: (_) => SiteListBloc(),
        child: const SiteListPage(),
      ),
      routes: [
        GoRoute(
          path: routeSiteDetails,
          builder: (_, state) {
            return BlocProvider(
              create: (context) => SiteDetailsBloc(
                storage: context.storage,
              ),
              child: SiteDetailsPage(
                siteId: state.pathParameters['siteId'] ?? '',
              ),
            );
          },
        ),
      ],
    ),
  ],
);
