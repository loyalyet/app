import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalyet_app/config/route/route_path.dart';
import 'package:loyalyet_app/modules/site/site.dart';

extension RouteContext on BuildContext {
  GoRouter get _router => GoRouter.of(this);

  void goSiteDetails(SiteId siteId) => _router.go(
        '$routeSiteList/$routeSiteDetails'.replaceAll(':siteId', siteId.name),
      );
}
