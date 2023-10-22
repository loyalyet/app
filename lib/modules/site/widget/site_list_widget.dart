import 'package:flutter/material.dart';
import 'package:loyalyet_app/config/route/route.dart';
import 'package:loyalyet_app/modules/site/domain/model/site.dart';

class SiteListWidget extends StatelessWidget {
  const SiteListWidget({
    required this.sites,
    super.key,
  });

  final List<Site> sites;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sites.length,
      itemBuilder: (context, index) {
        final site = sites[index];
        return ListTile(
          onTap: () => context.goSiteDetails(site.siteId),
          title: Text(site.name),
        );
      },
    );
  }
}
