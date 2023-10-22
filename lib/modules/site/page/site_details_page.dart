import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalyet_app/modules/site/bloc/site_details_data.dart';
import 'package:loyalyet_app/modules/site/site.dart';
import 'package:loyalyet_app/modules/site/widget/site_details_widget.dart';

class SiteDetailsPage extends StatefulWidget {
  const SiteDetailsPage({
    required this.siteId,
    super.key,
  });

  final String siteId;

  @override
  State<SiteDetailsPage> createState() => _SiteDetailsPageState();
}

class _SiteDetailsPageState extends State<SiteDetailsPage> {
  @override
  void initState() {
    super.initState();
    _loadSite();
  }

  @override
  void didUpdateWidget(covariant SiteDetailsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.siteId != oldWidget.siteId) {
      _loadSite();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SiteDetailsBloc, SiteDetailsState>(
      builder: (_, state) => Scaffold(
        appBar: AppBar(
          title: Text(state.site?.name ?? '#${widget.siteId}'),
        ),
        body: SiteDetailsWidget(state: state),
      ),
    );
  }

  void _loadSite() {
    context
        .read<SiteDetailsBloc>()
        .add(SiteDetailsEvent.loadSite(widget.siteId));
  }
}
