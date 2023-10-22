import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalyet_app/modules/site/bloc/site_details_data.dart';
import 'package:loyalyet_app/modules/site/data/sites.dart';
import 'package:loyalyet_app/modules/site_api/site_api.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

class SiteDetailsBloc extends Bloc<SiteDetailsEvent, SiteDetailsState> {
  SiteDetailsBloc({
    required this.storage,
  }) : super(const SiteDetailsState()) {
    on<LoadSite>(
      _loadSite,
      transformer: restartable(),
    );
  }

  final StorageRepositoryFactory storage;

  Future<void> _loadSite(LoadSite event, Emitter<SiteDetailsState> emit) async {
    var scopedState = state.copyWith(
      hasCredentials: null,
      site: null,
      siteData: null,
    );
    emit(scopedState);

    final filtered = hardCodedSites
        .where((site) => site.siteId.name == event.siteId)
        .toList(growable: false);
    final site = filtered.isNotEmpty ? filtered.first : null;
    emit(scopedState = scopedState.copyWith(site: site));
    if (site == null) return;

    final api = SiteApi.create(
      siteId: site.siteId,
      storage: storage,
      // TODO(daohoangson): implement authentication
      userId: '',
    );
    final credsData = await api.credsData;
    final hasCredentials = credsData != null;
    emit(scopedState = scopedState.copyWith(hasCredentials: hasCredentials));
    if (!hasCredentials) return;

    final siteData = await api.siteData;
    emit(scopedState = scopedState.copyWith(siteData: siteData));
  }
}
