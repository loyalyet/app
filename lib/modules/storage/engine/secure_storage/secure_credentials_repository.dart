import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:loyalyet_app/modules/site/site.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';

const _storage = FlutterSecureStorage();

Future<CredentialsRepository<T>>
    createSecureCredentialsRepository<T extends CredentialsData>({
  required SiteId siteId,
  required CredentialsDataUnmarshaler<T> unmarshaler,
}) async {
  return _SecureCredentialsRepository(
    siteId: siteId,
    unmarshaler: unmarshaler,
  );
}

class _SecureCredentialsRepository<T extends CredentialsData>
    extends CredentialsRepository<T> {
  _SecureCredentialsRepository({
    required this.siteId,
    required this.unmarshaler,
  });

  final SiteId siteId;
  final CredentialsDataUnmarshaler<T> unmarshaler;

  @override
  Future<T?> getCredentialsData(String userId) async {
    final str = await _storage.read(key: _getKey(userId));
    if (str == null) return null;

    final json = jsonDecode(str);
    if (json is! CredentialsDataJson) {
      return null;
    }

    return unmarshaler(json);
  }

  @override
  Future<void> putCredentialsData(String userId, T value) {
    final json = value.toJson();
    final str = jsonEncode(json);
    return _storage.write(key: _getKey(userId), value: str);
  }

  String _getKey(String userId) {
    return '$userId/${siteId.name}';
  }
}
