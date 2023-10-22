import 'package:flutter/foundation.dart';
import 'package:loyalyet_app/modules/site/site.dart';

@immutable
class Site {
  const Site({
    required this.name,
    required this.siteId,
  });

  final String name;
  final SiteId siteId;

  @override
  String toString() => 'Site(#${siteId.name})';
}
