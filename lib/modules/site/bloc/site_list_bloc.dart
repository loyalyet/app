import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalyet_app/modules/site/bloc/site_list_data.dart';
import 'package:loyalyet_app/modules/site/data/sites.dart';

class SiteListBloc extends Bloc<SiteListEvent, SiteListState> {
  SiteListBloc() : super(const SiteListState()) {
    on<LoadSites>((_, emit) => emit(state.copyWith(sites: hardCodedSites)));
  }
}
