import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalyet_app/l10n/l10n.dart';
import 'package:loyalyet_app/modules/site/bloc/site_list_data.dart';
import 'package:loyalyet_app/modules/site/site.dart';
import 'package:loyalyet_app/modules/site/widget/site_list_widget.dart';

class SiteListPage extends StatefulWidget {
  const SiteListPage({super.key});

  @override
  State<SiteListPage> createState() => _SiteListPageState();
}

class _SiteListPageState extends State<SiteListPage> {
  @override
  void initState() {
    super.initState();
    context.read<SiteListBloc>().add(const SiteListEvent.loadSites());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.siteListAppBarTitle),
      ),
      body: BlocSelector<SiteListBloc, SiteListState, List<Site>>(
        selector: (state) => state.sites,
        builder: (_, sites) => SiteListWidget(sites: sites),
      ),
    );
  }
}
