import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loyalyet_app/modules/site/domain/model/site.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

part 'site_details_data.freezed.dart';

@freezed
sealed class SiteDetailsEvent with _$SiteDetailsEvent {
  const factory SiteDetailsEvent.loadSite(String siteId) = LoadSite;
}

@freezed
class SiteDetailsState with _$SiteDetailsState {
  const factory SiteDetailsState({
    bool? hasCredentials,
    Site? site,
    SiteData? siteData,
  }) = _SiteDetailsState;
}
