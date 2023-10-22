import 'package:flutter/material.dart';
import 'package:loyalyet_app/l10n/l10n.dart';
import 'package:loyalyet_app/modules/site/bloc/site_details_data.dart';

class SiteDetailsWidget extends StatelessWidget {
  const SiteDetailsWidget({
    required this.state,
    super.key,
  });

  final SiteDetailsState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final site = state.site;
    if (site == null) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    final hasCredentials = state.hasCredentials;
    return ListView(
      children: [
        ListTile(
          title: Text(l10n.siteDetailsTileHasCredentialsQuestionMark),
          subtitle: hasCredentials != null
              ? Text(hasCredentials ? l10n.commonYes : l10n.commonNo)
              : const Align(
                  alignment: Alignment.centerLeft,
                  child: CircularProgressIndicator.adaptive(),
                ),
        ),
      ],
    );
  }
}
