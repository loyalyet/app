import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loyalyet_app/modules/site/domain/model/site.dart';

part 'site_list_data.freezed.dart';

@freezed
sealed class SiteListEvent with _$SiteListEvent {
  const factory SiteListEvent.loadSites() = LoadSites;
}

@freezed
class SiteListState with _$SiteListState {
  const factory SiteListState({
    @Default([]) List<Site> sites,
  }) = _SiteListState;
}
