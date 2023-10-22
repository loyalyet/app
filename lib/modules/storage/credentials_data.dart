import 'package:flutter/foundation.dart';

@immutable
abstract class CredentialsData {
  const CredentialsData();

  int get version;

  CredentialsDataJson toJson();
}

typedef CredentialsDataJson = Map<String, dynamic>;

typedef CredentialsDataUnmarshaler<T extends CredentialsData> = T Function(
  CredentialsDataJson json,
);

abstract class CredentialsRepository<T extends CredentialsData> {
  CredentialsRepository();

  Future<T?> getCredentialsData(String userId);
  Future<void> putCredentialsData(String userId, T value);
}
